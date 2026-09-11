#!/bin/bash
#SBATCH --cpus-per-task=1

java -jar maf/build/compare-worklist.jar --k 0 --strategy LIFO --output output/compare_worklist_4_0_LIFO.csv val.4
