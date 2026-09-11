#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy callDepth --output output/compare_worklist_10_0_callDepth.csv val.1
