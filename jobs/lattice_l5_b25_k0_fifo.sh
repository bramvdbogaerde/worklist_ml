#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

# module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 32 --data-suffix _all --k 0 --l 5 --b 25 --strategy fifo --model-dir ../models/lattice_l5_b25_k0_all
    