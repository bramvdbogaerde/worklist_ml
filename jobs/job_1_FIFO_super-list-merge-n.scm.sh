#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy FIFO --output output_full/output_1_FIFO_super-list-merge-n.scm.csv --reps 40 val/super-list-merge-n.scm
