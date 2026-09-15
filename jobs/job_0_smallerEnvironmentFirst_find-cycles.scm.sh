#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 0 --strategy smallerEnvironmentFirst --output output_full/output_0_smallerEnvironmentFirst_find-cycles.scm.csv --reps 40 val/find-cycles.scm
