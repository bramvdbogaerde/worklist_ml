#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy biggerEnvironmentFirst --output output/compare_worklist_5_1_biggerEnvironmentFirst.csv val.9
