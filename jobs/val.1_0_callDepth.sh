#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k 0 --strategy callDepth --output output/compare_worklist_10_0_callDepth.csv val_split/val.1
