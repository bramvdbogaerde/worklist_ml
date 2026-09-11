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
strategies = [
    "FIFO",
    "LIFO",
    "callDepth",
    "leastVisited",
    "mostVisited",
    "deepExpressionFirst",
    "shallowExpressionsFirst",
    "mostDependenciesFirst",
    "leastDependenciesFirst",
    "biggerEnvironmentFirst",
    "smallerEnvironmentFirst",
]

for i, dir in enumerate(dirs, 1): 
    for strategy in strategies:
        for k in range(0, 2): 
            jobname = dir + "_" + str(k) + "_" + strategy
            job = f"""#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --hint=multithread

java -jar maf/build/compare-worklist.jar --k {k} --strategy {strategy} --output output/compare_worklist_{i}_{k}_{strategy}.csv val_split/{dir}
"""
            print(f"[*] Writing job {jobname}")
            with open(JOB_DIR / (jobname+".sh"), "w") as f: 
                f.write(job)

print("Done")

