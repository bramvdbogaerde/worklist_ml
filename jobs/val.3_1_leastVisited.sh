#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy leastVisited --output output/compare_worklist_1_1_leastVisited.csv val.3
