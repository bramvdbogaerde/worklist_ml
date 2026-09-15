#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy biggerEnvironmentFirst --output output_full/output_1_biggerEnvironmentFirst_bound-precision.scm.csv --reps 40 val/bound-precision.scm
