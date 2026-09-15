#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy LIFO --output output_full/output_1_LIFO_letrec-begin.scm.csv --reps 40 val/letrec-begin.scm
