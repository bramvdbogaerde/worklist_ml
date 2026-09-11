#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output/compare_worklist_10_1_smallerEnvironmentFirst.csv val_split/val.1
