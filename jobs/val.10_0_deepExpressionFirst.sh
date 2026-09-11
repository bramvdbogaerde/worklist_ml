#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy deepExpressionFirst --output output/compare_worklist_8_0_deepExpressionFirst.csv val.10
