#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy LIFO --output output_full/output_0_LIFO_wc.scm.csv --reps 40 val/wc.scm
