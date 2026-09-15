#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 0 --strategy mostVisited --output output_full/output_0_mostVisited_infinite-3.scm.csv --reps 40 val/infinite-3.scm
