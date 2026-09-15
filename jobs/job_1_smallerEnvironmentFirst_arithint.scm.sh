#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy smallerEnvironmentFirst --output output_full/output_1_smallerEnvironmentFirst_arithint.scm.csv --reps 40 val/arithint.scm
