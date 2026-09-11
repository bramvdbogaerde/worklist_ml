#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy LIFO --output output/compare_worklist_4_1_LIFO.csv val_split/val.4
