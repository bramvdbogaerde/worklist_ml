#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy leastDependenciesFirst --output output/compare_worklist_4_1_leastDependenciesFirst.csv val.4
