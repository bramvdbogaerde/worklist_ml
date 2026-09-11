#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy LIFO --output output/compare_worklist_2_0_LIFO.csv val_split/val.7
