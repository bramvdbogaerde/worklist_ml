#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy leastDependenciesFirst --output output_full/output_1_leastDependenciesFirst_find-cycles.scm.csv --reps 40 val/find-cycles.scm
