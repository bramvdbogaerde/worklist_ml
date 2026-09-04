#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 1 --lookahead 2 --beam 25 --k 1 --data-suffix _all --model-dir models/lattice_l2_b25_k1_all --rename-jar True
    