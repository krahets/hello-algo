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
    # 當放置完所有行時，記錄解
    if row == n:
        res.append([list(row) for row in state])
        return
    # 走訪所有列
    for col in range(n):
        # 計算該格子對應的主對角線和次對角線
        diag1 = row - col + n - 1
        diag2 = row + col
        # 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # 嘗試：將皇后放置在該格子
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # 回退：將該格子恢復為空位
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """求解 n 皇后"""
    # 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # 記錄列是否有皇后
    diags1 = [False] * (2 * n - 1)  # 記錄主對角線上是否有皇后
    diags2 = [False] * (2 * n - 1)  # 記錄次對角線上是否有皇后
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"輸入棋盤長寬為 {n}")
    print(f"皇后放置方案共有 {len(res)} 種")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
