#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy shallowExpressionsFirst --output output/compare_worklist_5_0_shallowExpressionsFirst.csv val_split/val.9
