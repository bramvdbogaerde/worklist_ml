#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy deepExpressionFirst --output output/compare_worklist_10_1_deepExpressionFirst.csv val.1
