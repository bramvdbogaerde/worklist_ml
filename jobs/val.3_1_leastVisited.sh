#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy leastVisited --output output/compare_worklist_1_1_leastVisited.csv val_split/val.3
