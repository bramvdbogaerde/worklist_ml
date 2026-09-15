#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy deepExpressionFirst --output output_full/output_0_deepExpressionFirst_strong-update.scm.csv --reps 40 val/strong-update.scm
