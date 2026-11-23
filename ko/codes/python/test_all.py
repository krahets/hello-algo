import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # 소스 코드 파일을 찾는다
    src_paths = sorted(glob.glob("chapter_*/*.py"))
    errors = []

    # Python 코드를 실행한다
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # 프로세스가 완료될 때까지 기다린 후 출력과 오류 메시지를 가져온다
        stdout, stderr = process.communicate()
        # 종료 상태를 확인한다
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"파일 {len(src_paths)}개 테스트 완료")
    print(f"파일 {len(errors)}개에서 예외 발견")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))
