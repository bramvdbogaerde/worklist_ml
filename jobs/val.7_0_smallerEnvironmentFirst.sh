#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy smallerEnvironmentFirst --output output/compare_worklist_2_0_smallerEnvironmentFirst.csv val_split/val.7
