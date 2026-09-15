#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy LIFO --output output_full/output_0_LIFO_count.scm.csv --reps 40 val/count.scm
