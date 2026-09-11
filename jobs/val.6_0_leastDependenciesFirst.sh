#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy leastDependenciesFirst --output output/compare_worklist_7_0_leastDependenciesFirst.csv val.6
