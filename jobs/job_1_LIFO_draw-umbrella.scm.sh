#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_draw-umbrella.scm.csv --reps 40 val/draw-umbrella.scm
