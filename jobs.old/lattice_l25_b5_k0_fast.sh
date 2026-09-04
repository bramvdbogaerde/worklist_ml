#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
python3 scripts/lattice_pipeline.py --action evaluate --cores 32 --lookahead 25 --beam 5 --k 0 --features was_selected,is_main,norm_pending_updates,log_pending_updates,norm_wait,log_wait,norm_size,log_size,norm_out_degree,log_out_degree,norm_in_degree,log_in_degree,norm_visits,log_visits,norm_age,log_age,norm_delta_change,log_delta_change,norm_avg_input_levelToTop,log_avg_input_levelToTop,norm_arity,log_arity,norm_avg_neighbor_conv,log_avg_neighbor_conv --data-suffix _fast --model-dir models/lattice_l25_b5_k0_fast --rename-jar True
    