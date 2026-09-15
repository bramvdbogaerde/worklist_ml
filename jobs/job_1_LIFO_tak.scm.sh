#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_tak.scm.csv --reps 40 val/tak.scm
