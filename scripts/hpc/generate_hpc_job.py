from pathlib import Path
import os
import sys

SCRIPT_DIR = Path("scripts")
VALS_DIR = SCRIPT_DIR.parent / "val_split"

def job_template(action, val_dir, **parameters): 
    """
    Generates a template for supplied with the given parameters.
    """ 

    command = f"python3 {SCRIPT_DIR.as_posix()}/lattice_pipeline.py --action {action} --test-dir {val_dir} --cores 32"
    for (parameter_name, parameter_value) in parameters.items():
        command += f" --{parameter_name.replace("_", "-")} {parameter_value}"

    return f"""#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --time=48:00:00

module load Gradle/8.14.3-Java-21
{command}
    """

JOB_DIR = SCRIPT_DIR.parent / "jobs"

# Generate random exploration tasks for every validation directory
if not (JOB_DIR).exists():
    os.mkdir(JOB_DIR)
else: 
    print("Warning: jobs directory already exists, do you want to continue? (y/n)?")
    if input() not in ["y", "Y", "yes"]: 
        print("Quitting...")
        sys.exit(1)
        
dirs = os.listdir(VALS_DIR)

for i, dir in enumerate(dirs, 1): 
    for k in range(0, 2): 
        jobname = dir + "_" + str(k)
        job = job_template("generate-random", VALS_DIR / dir, data_suffix = f"_{jobname}", k=k)
        print(f"[*] Writing job {jobname}")
        with open(JOB_DIR / (jobname+".sh"), "w") as f: 
            f.write(job)

print("Done")

