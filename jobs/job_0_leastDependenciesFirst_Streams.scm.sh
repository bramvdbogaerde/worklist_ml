#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/jar --k 0 --strategy leastDependenciesFirst --output output_full/output_0_leastDependenciesFirst_Streams.scm.csv --reps 40 val/Streams.scm
