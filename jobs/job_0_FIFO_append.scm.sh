#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 0 --strategy FIFO --output output_full/output_0_FIFO_append.scm.csv --reps 40 val/append.scm
