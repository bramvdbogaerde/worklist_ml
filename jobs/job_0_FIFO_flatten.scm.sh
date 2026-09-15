#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 0 --strategy FIFO --output output_full/output_0_FIFO_flatten.scm.csv --reps 40 val/flatten.scm
