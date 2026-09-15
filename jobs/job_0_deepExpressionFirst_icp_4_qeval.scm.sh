#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy deepExpressionFirst --output output_full/output_0_deepExpressionFirst_icp_4_qeval.scm.csv --reps 40 val/icp_4_qeval.scm
