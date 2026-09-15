#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy biggerEnvironmentFirst --output output_full/output_1_biggerEnvironmentFirst_map.scm.csv --reps 40 val/map.scm
