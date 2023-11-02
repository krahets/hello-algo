import glob
import subprocess

if __name__ == "__main__":
    # find source code files
    src_paths = sorted(glob.glob("codes/python/chapter_*/*.py"))
    errors = []
    error_count = 0

    # run python code
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        # Wait for the process to complete, and get the output and error messages
        stdout, stderr = process.communicate()
        # Check the exit status
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)
            error_count += 1

    print(f"===== Found exception in {error_count} files =====")
    for error in errors:
        print(error + "\n")
