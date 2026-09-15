#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist.jar --k 1 --strategy leastDependenciesFirst --output output_full/output_1_leastDependenciesFirst_sales-period.scm.csv --reps 40 val/sales-period.scm
