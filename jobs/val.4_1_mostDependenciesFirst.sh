#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy mostDependenciesFirst --output output/compare_worklist_4_1_mostDependenciesFirst.csv val.4
