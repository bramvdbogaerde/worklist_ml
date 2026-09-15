#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy leastDependenciesFirst --output output_full/output_1_leastDependenciesFirst_string.scm.csv --reps 40 val/string.scm
