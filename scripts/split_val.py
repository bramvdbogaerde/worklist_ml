# Script to split the test_dir (validation) directory into multiple directories so that they can be distributed
# across multiple nodes.

from pathlib import Path
import os
import numpy as np
import shutil

SCRIPT_PATH = Path(__file__).parent
VAL_DIR = SCRIPT_PATH.parent / "val"

files = os.listdir(VAL_DIR)
groups = [ x.tolist() for x in np.array_split(files, 10) ]

for i, group in enumerate(groups, 1): 
    new_dir = VAL_DIR.as_posix() + "." + str(i)
    os.mkdir(new_dir)
    for file in group: 
        print(f"[*] copying {file} into {new_dir}")
        shutil.copyfile(VAL_DIR / file, new_dir + "/" + file)       


print("Done")
