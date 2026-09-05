from pathlib import Path

SCRIPT_DIR = Path("scripts")
VALS_DIR = SCRIPT_DIR.parent / "val_split"

def job_template(action, val_dir = None, extra_args = (), cores = 32, **parameters):
    """
    Generates a template for supplied with the given parameters.

    `extra_args` is a list of already formatted command-line arguments
    (e.g. ["--lookahead", "2"]) that is appended to the generated command.
    """

    command = f"python3 {SCRIPT_DIR.as_posix()}/lattice_pipeline.py --action {action} --cores {cores}"
    if val_dir is not None:
        command += f" --test-dir {val_dir}"
    for (parameter_name, parameter_value) in parameters.items():
        command += f" --{parameter_name.replace("_", "-")} {parameter_value}"
    if extra_args:
        command += " " + " ".join(map(str, extra_args))

    return f"""#!/bin/bash
#SBATCH --exclusive

# module load Gradle/8.14.3-Java-21
{command}
    """
