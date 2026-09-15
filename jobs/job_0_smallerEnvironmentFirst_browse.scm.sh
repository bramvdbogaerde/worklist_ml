#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 0 --strategy smallerEnvironmentFirst --output output_full/output_0_smallerEnvironmentFirst_browse.scm.csv --reps 40 val/browse.scm
