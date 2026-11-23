import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # Find source code files
    src_paths = sorted(glob.glob("chapter_*/*.py"))
    errors = []

    # Run Python code
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # Wait for the process to finish and collect its output and error messages
        stdout, stderr = process.communicate()
        # Check the exit status
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"Tested {len(src_paths)} files")
    print(f"Found exceptions in {len(errors)} files")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))
