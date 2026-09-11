#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy callDepth --output output/compare_worklist_6_0_callDepth.csv val.5
