#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_my-list.scm.csv --reps 40 val/my-list.scm
