#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 32 --lookahead 15 --beam 50 --k 1 --data-suffix _all --model-dir models/lattice_l15_b50_k1_all --rename-jar True
    