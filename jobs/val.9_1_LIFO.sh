#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy LIFO --output output/compare_worklist_5_1_LIFO.csv val_split/val.9
