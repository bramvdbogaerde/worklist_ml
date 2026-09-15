#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy FIFO --output output_full/output_1_FIFO_fringe.scm.csv --reps 40 val/fringe.scm
