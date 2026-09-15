#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 1 --strategy callDepth --output output_full/output_1_callDepth_count-pairs2.scm.csv --reps 40 val/count-pairs2.scm
