#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output/compare_worklist_5_1_smallerEnvironmentFirst.csv val.9
