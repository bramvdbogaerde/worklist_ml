#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy leastDependenciesFirst --output output/compare_worklist_7_0_leastDependenciesFirst.csv val_split/val.6
