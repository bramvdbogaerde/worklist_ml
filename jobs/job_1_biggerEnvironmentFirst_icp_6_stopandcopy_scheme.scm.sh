#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy biggerEnvironmentFirst --output output_full/output_1_biggerEnvironmentFirst_icp_6_stopandcopy_scheme.scm.csv --reps 40 val/icp_6_stopandcopy_scheme.scm
