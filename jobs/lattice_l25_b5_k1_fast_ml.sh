#!/bin/bash
#SBATCH --exclusive

# module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 32 --data-suffix _fast --k 1 --l 25 --b 5 --strategy ML --model-dir ../models/lattice_l25_b5_k1_fast --rename-jar True
    