#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy mostVisited --output output_full/output_1_mostVisited_lightbulb.scm.csv --reps 40 val/lightbulb.scm
