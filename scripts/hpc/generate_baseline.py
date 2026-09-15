import pandas as pd 
from pathlib import Path


BENCH_PATH = Path("/Users/bram/Seafile/phd-common/papers/wip/vmcai-ml-for-worklist-order/ml-for-worklist-order/experimental-data/best.csv")

df = pd.read_csv(BENCH_PATH)

for (_, row) in df[["benchmark", "k", "strategy"]].iterrows():
    filepath = f"val/{row["benchmark"]}"
    benchmark = row["benchmark"]
    k = row["k"]
    strategy = row["strategy"]

    s = f"""#!/bin/bash
#SBATCH --exclusive

java -jar maf/build/compare-worklist/compare-worklist.jar --k {k} --strategy {strategy} --output output_full/output_{k}_{strategy}_{benchmark}.csv --reps 40 {filepath}
"""

    with open(f"jobs/job_{k}_{strategy}_{benchmark}.sh", "w") as f: 
        f.write(s)

