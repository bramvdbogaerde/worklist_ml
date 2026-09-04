#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 32 --lookahead 5 --beam 5 --k 0 --data-suffix _all --model-dir models/lattice_l5_b5_k0_all --rename-jar True
    