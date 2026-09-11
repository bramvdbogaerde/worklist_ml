#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy leastVisited --output output/compare_worklist_1_0_leastVisited.csv val.3
