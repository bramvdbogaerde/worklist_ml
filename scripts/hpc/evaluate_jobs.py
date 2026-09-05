
from pathlib import Path
import os
import sys
import utils
from utils import SCRIPT_DIR
import utils

JOB_DIR = SCRIPT_DIR.parent / "jobs"

# Generate random exploration tasks for every validation directory
if not (JOB_DIR).exists():
    os.mkdir(JOB_DIR)
else: 
    print("Warning: jobs directory already exists, do you want to continue? (y/n)?")
    if input() not in ["y", "Y", "yes"]: 
        print("Quitting...")
        sys.exit(1)
 


# The following configurations are chosen: 
# k=0, l=5, b=25
# k=1, l=25, b=5
# 
# Then generate the following jobs (cartesian): 
# - for each configuration a job that has fast and all 
# - for each configuration a job that has strategy=fifo and strategy=ML

configurations = [
    {"k": 0, "l": 5, "b": 25},
    {"k": 1, "l": 25, "b": 5}
]

for config in configurations: 
    # Generate a FIFO job for this configuration
    jobname = f"lattice_l{config['l']}_b{config['b']}_k{config['k']}_fifo"
    model_dir = f"lattice_l{config['l']}_b{config['b']}_k{config['k']}_all"
    job = utils.job_template("evaluate", None, data_suffix = f"_all", k=config['k'], l=config['l'], b=config['b'], strategy="FIFO", model_dir="../models/"+model_dir, rename_jar=True)

    print(f"[*] Writing job {jobname}")
    with open(JOB_DIR / (jobname+".sh"), "w") as f: 
        f.write(job)

    # Generate a ML job for this configuration for the fast and all variants of
    # the model 
    for model_variant in ["fast", "all"]: 
        jobname = f"lattice_l{config['l']}_b{config['b']}_k{config['k']}_{model_variant}_ml"
        model_dir = f"lattice_l{config['l']}_b{config['b']}_k{config['k']}_{model_variant}"
        if model_variant == "fast":
            job = utils.job_template("evaluate", None, data_suffix = f"_{model_variant}", k=config['k'], l=config['l'], b=config['b'], strategy="ML", model_dir="../models/"+model_dir, rename_jar=True, features="fast")
        else: 
            job = utils.job_template("evaluate", None, data_suffix = f"_{model_variant}", k=config['k'], l=config['l'], b=config['b'], strategy="ML", model_dir="../models/"+model_dir, rename_jar=True)

        print(f"[*] Writing job {jobname}")
        with open(JOB_DIR / (jobname+".sh"), "w") as f: 
            f.write(job)

print("Done")

