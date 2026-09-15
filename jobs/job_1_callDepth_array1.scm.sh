#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare_worklist.jar --k 1 --strategy callDepth --output output_full/output_1_callDepth_array1.scm.csv --reps 40 val/array1.scm
