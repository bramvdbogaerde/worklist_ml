from pathlib import Path
import os
import sys
import utils
from utils import SCRIPT_DIR, VALS_DIR

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
        job = utils.job_template("generate-random", VALS_DIR / dir, data_suffix = f"_{jobname}", k=k)
        print(f"[*] Writing job {jobname}")
        with open(JOB_DIR / (jobname+".sh"), "w") as f: 
            f.write(job)

print("Done")

