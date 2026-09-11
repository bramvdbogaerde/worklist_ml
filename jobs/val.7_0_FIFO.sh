#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy FIFO --output output/compare_worklist_2_0_FIFO.csv val_split/val.7
