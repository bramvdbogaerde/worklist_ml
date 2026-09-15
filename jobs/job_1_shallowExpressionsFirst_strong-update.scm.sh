#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy shallowExpressionsFirst --output output_full/output_1_shallowExpressionsFirst_strong-update.scm.csv --reps 40 val/strong-update.scm
