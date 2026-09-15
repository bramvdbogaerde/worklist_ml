#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy deepExpressionFirst --output output_full/output_1_deepExpressionFirst_puzzle.scm.csv --reps 40 val/puzzle.scm
