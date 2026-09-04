#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action generate-random --test-dir val_split/val.9 --cores 32 --data-suffix _val.9_1 --k 1
    