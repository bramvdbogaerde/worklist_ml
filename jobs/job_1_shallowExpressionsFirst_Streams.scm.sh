#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k 1 --strategy shallowExpressionsFirst --output output_full/output_1_shallowExpressionsFirst_Streams.scm.csv --reps 40 val/Streams.scm
