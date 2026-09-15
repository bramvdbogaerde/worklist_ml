#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output_full/output_1_smallerEnvironmentFirst_collatz.scm.csv --reps 40 val/collatz.scm
