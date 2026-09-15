#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy mostDependenciesFirst --output output_full/output_0_mostDependenciesFirst_eta.scm.csv --reps 40 val/eta.scm
