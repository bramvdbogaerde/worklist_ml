#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy deepExpressionFirst --output output/compare_worklist_4_0_deepExpressionFirst.csv val_split/val.4
