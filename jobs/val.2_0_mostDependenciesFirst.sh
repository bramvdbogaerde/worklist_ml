#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy mostDependenciesFirst --output output/compare_worklist_9_0_mostDependenciesFirst.csv val_split/val.2
