#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy biggerEnvironmentFirst --output output_full/output_1_biggerEnvironmentFirst_square-and-rectangle.scm.csv --reps 40 val/square-and-rectangle.scm
