#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 0 --strategy biggerEnvironmentFirst --output output_full/output_0_biggerEnvironmentFirst_loop.scm.csv --reps 40 val/loop.scm
