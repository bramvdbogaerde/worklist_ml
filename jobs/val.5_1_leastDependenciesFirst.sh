#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 1 --strategy leastDependenciesFirst --output output/compare_worklist_6_1_leastDependenciesFirst.csv val_split/val.5
