#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy FIFO --output output_full/output_1_FIFO_dedouble.scm.csv --reps 40 val/dedouble.scm
