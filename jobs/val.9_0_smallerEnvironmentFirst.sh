#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy smallerEnvironmentFirst --output output/compare_worklist_5_0_smallerEnvironmentFirst.csv val_split/val.9
