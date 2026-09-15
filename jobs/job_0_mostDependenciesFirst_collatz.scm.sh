#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy mostDependenciesFirst --output output_full/output_0_mostDependenciesFirst_collatz.scm.csv --reps 40 val/collatz.scm
