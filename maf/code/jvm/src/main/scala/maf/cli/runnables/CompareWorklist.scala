package maf.cli.runnables

import maf.language.scheme.*
import maf.modular.*
import maf.core.*
import maf.modular.scheme.*
import maf.modular.scheme.modf.*
import maf.modular.worklist.*
import maf.core.worklist.{WorkList, FIFOWorkList}
import maf.util.Reader
import maf.util.benchmarks.Timeout
import java.io.File
import scala.language.unsafeNulls
import scala.concurrent.duration._
import scala.util.Try
import java.nio.file.Paths
import java.nio.file.Files
import scala.jdk.CollectionConverters._
import java.io.PrintWriter
import java.io.BufferedWriter
import java.io.FileWriter
import maf.util.benchmarks.Timer

/** 
 *  Compares deterministic worklist algorithms in terms of number of iterations 
 */
object CompareWorklist:
    abstract class BasicAnalysis(program: SchemeExp, val k: Int)
        extends SimpleSchemeModFAnalysis(program)
        with SchemeConstantPropagationDomain
        with DependencyTracking[SchemeExp]
        with SchemeModFKCallSiteSensitivity
        with WorklistAlgorithm[SchemeExp] {

        var steps: Int = 0
        override def intraAnalysis(cmp: SchemeModFComponent) =
            new IntraAnalysis(cmp) with BigStepModFIntra with DependencyTrackingIntra 

    }

    trait StepCount extends BasicAnalysis: 
        abstract override def step(t: Timeout.T) = {
          super.step(t)
          steps += 1
        }

    def fifoAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with FIFOWorklistAlgorithm[SchemeExp] with StepCount
    def lifoAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with LIFOWorklistAlgorithm[SchemeExp] with StepCount
    def callDepthAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with CallDepthFirstWorklistAlgorithm[SchemeExp] with StepCount

    def leastVisitedAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with LeastVisitedFirstWorklistAlgorithm[SchemeExp] with StepCount

    def mostVisitedAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with MostVisitedFirstWorklistAlgorithm[SchemeExp] with StepCount

    def deepExpressionFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with DeepExpressionsFirstWorklistAlgorithm[SchemeExp] with StepCount

    def shallowExpressionsFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with ShallowExpressionsFirstWorklistAlgorithm[SchemeExp] with StepCount

    def mostDependenciesFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with MostDependenciesFirstWorklistAlgorithm[SchemeExp] with StepCount

    def leastDependenciesFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with LeastDependenciesFirstWorklistAlgorithm[SchemeExp] with StepCount

    def biggerEnvironmentFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with BiggerEnvironmentFirstWorklistAlgorithm.ModF with StepCount

    def smallerEnvironmentFirstAnalysis(program: SchemeExp, theK: Int) = new BasicAnalysis(program, theK) with SmallerEnvironmentFirstWorklistAlgorithm.ModF with StepCount

    private val analyses = Map(
        ("FIFO", fifoAnalysis),
        ("LIFO", lifoAnalysis),
        ("callDepth", callDepthAnalysis),
        ("leastVisited", leastVisitedAnalysis),
        ("mostVisited", mostVisitedAnalysis),
        ("deepExpressionFirst", deepExpressionFirstAnalysis),
        ("shallowExpressionsFirst", shallowExpressionsFirstAnalysis),
        ("mostDependenciesFirst", mostDependenciesFirstAnalysis),
        ("leastDependenciesFirst", leastDependenciesFirstAnalysis),
        ("biggerEnvironmentFirst", biggerEnvironmentFirstAnalysis),
        ("smallerEnvironmentFirst", smallerEnvironmentFirstAnalysis),
    )

    case class CommandArguments(
      k: Int = 0,
      program: Option[String] = None,
      strategy: Option[String] = None,
      reps: Int = 1,
      output: Option[String] = None
    ) {
      def toOptions(): Options = 
        Options(
          k = k, 
          program = program.getOrElse(invalidArgument("program has not been specified")),
          strategy = strategy,
          output = output,
          reps = reps
        )
    }

    case class Options(k: Int, program: String, strategy: Option[String], output: Option[String], reps: Int)

    def invalidArgument[T](msg: String): T = 
      println(s"Failed to parse arguments: $msg")
      System.exit(1)
      throw Exception("unreachable")

    def programError[T](msg: String): T = 
      println("Unexpected error encountered: ") 
      println(msg)
      System.exit(1)
      throw Exception("unreachable")


    def main(args: Array[String]): Unit = 
      var argList = args.toList
      var parsedArgs = CommandArguments()
      while !argList.isEmpty do {
        val head = argList.head
        argList = argList.tail
        head match {
          case "--k" => 
            val head = argList.headOption.getOrElse(invalidArgument("no value for --k specified"))
            parsedArgs = parsedArgs.copy(k = Try(head.toInt).toOption.getOrElse(invalidArgument("expected number for --k")))
            argList = argList.tail               
            
          case "--strategy" => 
            val head = argList.headOption.getOrElse(invalidArgument("no value for --strategy specified"))
            if analyses.contains(head) then
              parsedArgs = parsedArgs.copy(strategy = Some(head))
            else 
              invalidArgument(s"invalid strategy ${head} use one of ${analyses.keySet.mkString(",")}, or pass nothing to evaluate all strategies")

            argList = argList.tail

          case "--output" => 
            val head = argList.headOption.getOrElse(invalidArgument("no value for --output specified"))
            parsedArgs = parsedArgs.copy(output = Some(head))
            argList = argList.tail

          case "--reps" => 
            val head = argList.headOption.getOrElse(invalidArgument("no value for --reps specified"))
            parsedArgs = parsedArgs.copy(reps = Try(head.toInt).toOption.getOrElse(invalidArgument("expected number for --reps")))
            argList = argList.tail

          case program => 
            parsedArgs = parsedArgs.copy(program = Some(program))
        }
      }

      val options = parsedArgs.toOptions()
      val benchmarkPath = Paths.get(options.program)
      if !Files.exists(benchmarkPath) then
        programError(s"Benchmark path ${benchmarkPath} does not exist")

      // analyze all the benchmarks in the given directory if a directory
      // has been passed, otherwise analyze a single one.
      val benchmarks = 
        if Files.isDirectory(benchmarkPath) then 
          Files.list(benchmarkPath).iterator().asScala.toList
        else 
          List(benchmarkPath)

      // selected strategies
      val strategies = options.strategy.map(s => List(s)).getOrElse(analyses.keys.toList)

      // output selection
      val output: PrintWriter = options.output.map((name: String) => new PrintWriter(new FileWriter(new File(name), false), true)).getOrElse(new PrintWriter(System.out, true))

      output.println("benchmark,strategy,k,iterations,time,rep")
      for benchmark <- benchmarks do {
          val program = SchemeParser.parseProgram(Reader.loadFile(benchmark.toString))
          for strategy <- strategies do {
            for iter <- 1 to options.reps do {
              println(s"Running $strategy on ${benchmark.getFileName()} $iter/${options.reps}")
              val anl = analyses(strategy)(program, options.k)
              val (ellapsed_time, _) = Timer.time(anl.analyze())
              output.println(s"${benchmark.getFileName()},$strategy,${options.k},${anl.steps},$ellapsed_time,$iter")
              output.flush()
            }
          }
      }
        
