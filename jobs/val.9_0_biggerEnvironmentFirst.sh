#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy biggerEnvironmentFirst --output output/compare_worklist_5_0_biggerEnvironmentFirst.csv val.9
