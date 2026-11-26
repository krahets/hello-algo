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
    """回溯演算法：n 皇后"""
    # 每一列都放好皇后後，記錄此解
    if row == n:
        res.append([list(row) for row in state])
        return
    # 逐一檢查各欄
    for col in range(n):
        # 計算這一格對應的主對角線與副對角線索引
        diag1 = row - col + n - 1
        diag2 = row + col
        # 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 嘗試：將皇后放在這一格
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 在下一列放置皇后
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 回溯：將這一格還原為空位
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """求解 n 皇后問題"""
    # 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 記錄各欄是否已有皇后
    diags1 = [False] * (2 * n - 1)  # 記錄各主對角線上是否已有皇后
    diags2 = [False] * (2 * n - 1)  # 記錄各副對角線上是否已有皇后
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"輸入棋盤的邊長為 {n}")
    print(f"皇后共有 {len(res)} 種擺法")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
