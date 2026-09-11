#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy FIFO --output output/compare_worklist_7_0_FIFO.csv val_split/val.6
