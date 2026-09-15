#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 0 --strategy smallerEnvironmentFirst --output output_full/output_0_smallerEnvironmentFirst_kcfa2.scm.csv --reps 40 val/kcfa2.scm
