#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 0 --strategy mostDependenciesFirst --output output_full/output_0_mostDependenciesFirst_icp_6_stopandcopy_scheme.scm.csv --reps 40 val/icp_6_stopandcopy_scheme.scm
