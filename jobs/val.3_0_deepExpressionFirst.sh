#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy deepExpressionFirst --output output/compare_worklist_1_0_deepExpressionFirst.csv val_split/val.3
