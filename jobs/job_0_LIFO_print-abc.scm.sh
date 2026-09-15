#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy LIFO --output output_full/output_0_LIFO_print-abc.scm.csv --reps 40 val/print-abc.scm
