#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy FIFO --output output_full/output_1_FIFO_apple-tree.scm.csv --reps 40 val/apple-tree.scm
