import os
import glob
import subprocess

env = os.environ.copy()
env["PYTHONIOENCODING"] = "utf-8"

if __name__ == "__main__":
    # ソースコードファイルを検索
    src_paths = sorted(glob.glob("ja/codes/python/chapter_*/*.py"))
    errors = []

    # python コードを実行
    for src_path in src_paths:
        process = subprocess.Popen(
            ["python", src_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            encoding='utf-8'
        )
        # プロセスの完了を待ち、出力とエラーメッセージを取得
        stdout, stderr = process.communicate()
        # 終了ステータスをチェック
        exit_status = process.returncode
        if exit_status != 0:
            errors.append(stderr)

    print(f"{len(src_paths)} ファイルをテストしました")
    print(f"{len(errors)} ファイルで例外が見つかりました")
    if len(errors) > 0:
        raise RuntimeError("\n\n".join(errors))