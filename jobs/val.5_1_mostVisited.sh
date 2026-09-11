#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy mostVisited --output output/compare_worklist_6_1_mostVisited.csv val_split/val.5
