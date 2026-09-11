#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 1 --strategy callDepth --output output/compare_worklist_10_1_callDepth.csv val_split/val.1
