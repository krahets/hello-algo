"""
File: n_queens.py
Created Time: 2023-04-26
Author: krahets (krahets@163.com)
"""


def backtrack(
    row: int,
    n: int,
    state: list[list[str]],
    res: list[list[list[str]]],
    cols: list[bool],
    diags1: list[bool],
    diags2: list[bool],
):
    """バックトラッキングアルゴリズム：n クイーン"""
    # すべての行が配置されたら、解を記録
    if row == n:
        res.append([list(row) for row in state])
        return
    # すべての列を走査
    for col in range(n):
        # セルに対応する主対角線と副対角線を計算
        diag1 = row - col + n - 1
        diag2 = row + col
        # 枝刈り：セルの列、主対角線、副対角線にクイーンを配置しない
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 試行：セルにクイーンを配置
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 次の行を配置
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 撤回：セルを空のスポットに復元
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """n クイーンを解く"""
    # n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # クイーンがある列を記録
    diags1 = [False] * (2 * n - 1)  # クイーンがある主対角線を記録
    diags2 = [False] * (2 * n - 1)  # クイーンがある副対角線を記録
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""ドライバーコード"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"チェスボードの寸法入力：{n}")
    print(f"クイーン配置解の総数は {len(res)}")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)