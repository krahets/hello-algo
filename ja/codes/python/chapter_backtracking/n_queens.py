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
    """バックトラッキング：N クイーン"""
    # すべての行への配置が完了したら、解を記録する
    if row == n:
        res.append([list(row) for row in state])
        return
    # すべての列を走査
    for col in range(n):
        # このマスに対応する主対角線と副対角線を計算
        diag1 = row - col + n - 1
        diag2 = row + col
        # 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 試行：そのマスにクイーンを置く
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 次の行に配置する
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 戻す：そのマスを空きマスに戻す
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """N クイーンを解く"""
    # n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 列にクイーンがあるか記録
    diags1 = [False] * (2 * n - 1)  # 主対角線にクイーンがあるかを記録
    diags2 = [False] * (2 * n - 1)  # 副対角線にクイーンがあるかを記録
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"入力された盤面の縦横の長さは {n} です")
    print(f"クイーンの配置パターンは全部で {len(res)} 通りです")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
