#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 0 --strategy FIFO --output output_full/output_0_FIFO_icp_1c_ambeval.scm.csv --reps 40 val/icp_1c_ambeval.scm
