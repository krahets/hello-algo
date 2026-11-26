import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # 소스 코드 파일 찾기
    src_paths = sorted(glob.glob("chapter_*/*.py"))
    errors = []

    # 파이썬 코드 실행
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # 프로세스가 종료될 때까지 기다린 뒤 출력과 오류 메시지를 가져온다.
        stdout, stderr = process.communicate()
        # 종료 상태 확인
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"Tested {len(src_paths)} files")
    print(f"Found exception in {len(errors)} files")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))
