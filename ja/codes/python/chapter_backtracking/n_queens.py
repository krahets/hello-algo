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
    """バックトラッキングによる n クイーン問題"""
    # すべての行に置いたら解を記録する
    if row == n:
        res.append([list(row) for row in state])
        return
    # すべての列を調べる
    for col in range(n):
        # このマスを通る主対角線と副対角線を求める
        diag1 = row - col + n - 1
        diag2 = row + col
        # 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 試行：このマスにクイーンを置く
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 次の行に置く
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 後戻り：このマスを空きに戻す
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """n クイーン問題を解く"""
    # n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 各列にクイーンがあるか記録する
    diags1 = [False] * (2 * n - 1)  # 各主対角線にクイーンがあるか記録する
    diags2 = [False] * (2 * n - 1)  # 各副対角線にクイーンがあるか記録する
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"盤面の一辺の長さ：{n}")
    print(f"クイーンの配置は全部で {len(res)} 通り")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
