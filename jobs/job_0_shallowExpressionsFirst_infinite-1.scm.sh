#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 0 --strategy shallowExpressionsFirst --output output_full/output_0_shallowExpressionsFirst_infinite-1.scm.csv --reps 40 val/infinite-1.scm
