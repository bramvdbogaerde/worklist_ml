#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output_full/output_1_smallerEnvironmentFirst_tree-with-branches.scm.csv --reps 40 val/tree-with-branches.scm
