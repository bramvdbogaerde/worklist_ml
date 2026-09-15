#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy leastDependenciesFirst --output output_full/output_1_leastDependenciesFirst_let.scm.csv --reps 40 val/let.scm
