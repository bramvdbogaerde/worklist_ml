#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output_full/output_1_smallerEnvironmentFirst_infinite-2.scm.csv --reps 40 val/infinite-2.scm
