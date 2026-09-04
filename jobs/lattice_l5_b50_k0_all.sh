#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --time=48:00:00

# module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 1 --lookahead 5 --beam 50 --k 0 --data-suffix _all --model-dir models/lattice_l5_b50_k0_all --rename-jar True
    