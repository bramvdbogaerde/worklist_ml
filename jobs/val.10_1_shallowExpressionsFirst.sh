#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy shallowExpressionsFirst --output output/compare_worklist_8_1_shallowExpressionsFirst.csv val.10
