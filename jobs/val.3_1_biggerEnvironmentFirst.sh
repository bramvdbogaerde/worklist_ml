#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy biggerEnvironmentFirst --output output/compare_worklist_1_1_biggerEnvironmentFirst.csv val_split/val.3
