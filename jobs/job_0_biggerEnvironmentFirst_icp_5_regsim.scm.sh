#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 0 --strategy biggerEnvironmentFirst --output output_full/output_0_biggerEnvironmentFirst_icp_5_regsim.scm.csv --reps 40 val/icp_5_regsim.scm
