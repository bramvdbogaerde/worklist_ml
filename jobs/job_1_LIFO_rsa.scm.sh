#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_rsa.scm.csv --reps 40 val/rsa.scm
