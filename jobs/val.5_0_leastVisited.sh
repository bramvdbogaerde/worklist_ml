#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy leastVisited --output output/compare_worklist_6_0_leastVisited.csv val_split/val.5
