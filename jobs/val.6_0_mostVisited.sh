#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy mostVisited --output output/compare_worklist_7_0_mostVisited.csv val_split/val.6
