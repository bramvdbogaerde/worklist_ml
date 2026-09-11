#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy FIFO --output output/compare_worklist_1_1_FIFO.csv val_split/val.3
