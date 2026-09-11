#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy callDepth --output output/compare_worklist_5_1_callDepth.csv val.9
