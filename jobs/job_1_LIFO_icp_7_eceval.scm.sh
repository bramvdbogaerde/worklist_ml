#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_icp_7_eceval.scm.csv --reps 40 val/icp_7_eceval.scm
