#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 0 --strategy smallerEnvironmentFirst --output output_full/output_0_smallerEnvironmentFirst_list-compare-n.scm.csv --reps 40 val/list-compare-n.scm
