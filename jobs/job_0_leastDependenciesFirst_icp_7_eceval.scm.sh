#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy leastDependenciesFirst --output output_full/output_0_leastDependenciesFirst_icp_7_eceval.scm.csv --reps 40 val/icp_7_eceval.scm
