#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy smallerEnvironmentFirst --output output_full/output_1_smallerEnvironmentFirst_lattice.scm.csv --reps 40 val/lattice.scm
