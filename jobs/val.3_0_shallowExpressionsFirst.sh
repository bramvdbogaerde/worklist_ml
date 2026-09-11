#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy shallowExpressionsFirst --output output/compare_worklist_1_0_shallowExpressionsFirst.csv val.3
