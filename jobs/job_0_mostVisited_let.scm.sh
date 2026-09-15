#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy mostVisited --output output_full/output_0_mostVisited_let.scm.csv --reps 40 val/let.scm
