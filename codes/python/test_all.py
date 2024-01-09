import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # find source code files
    src_paths = sorted(glob.glob("codes/python/chapter_*/*.py"))
    errors = []

    # run python code
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # Wait for the process to complete, and get the output and error messages
        stdout, stderr = process.communicate()
        # Check the exit status
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"Tested {len(src_paths)} files")
    print(f"Found exception in {len(errors)} files")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))
