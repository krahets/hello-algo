import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # 尋找原始碼檔案
    src_paths = sorted(glob.glob("chapter_*/*.py"))
    errors = []

    # 執行 Python 程式碼
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # 等待行程結束，再取得輸出和錯誤訊息
        stdout, stderr = process.communicate()
        # 檢查結束狀態
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"Tested {len(src_paths)} files")
    print(f"Found exception in {len(errors)} files")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))
