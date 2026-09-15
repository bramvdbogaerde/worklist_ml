#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy shallowExpressionsFirst --output output_full/output_1_shallowExpressionsFirst_icp_4_qeval.scm.csv --reps 40 val/icp_4_qeval.scm
