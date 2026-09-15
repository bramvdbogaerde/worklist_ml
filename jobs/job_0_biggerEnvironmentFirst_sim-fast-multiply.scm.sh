#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy biggerEnvironmentFirst --output output_full/output_0_biggerEnvironmentFirst_sim-fast-multiply.scm.csv --reps 40 val/sim-fast-multiply.scm
