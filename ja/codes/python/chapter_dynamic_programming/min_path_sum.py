"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """最小パス和：ブルートフォース探索"""
    # 左上のセルの場合、探索を終了
    if i == 0 and j == 0:
        return grid[0][0]
    # 行または列のインデックスが範囲外の場合、+∞ コストを返す
    if i < 0 or j < 0:
        return inf
    # 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # 左上から (i, j) への最小パスコストを返す
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """最小パス和：記憶化探索"""
    # 左上のセルの場合、探索を終了
    if i == 0 and j == 0:
        return grid[0][0]
    # 行または列のインデックスが範囲外の場合、+∞ コストを返す
    if i < 0 or j < 0:
        return inf
    # 記録がある場合、それを返す
    if mem[i][j] != -1:
        return mem[i][j]
    # 左と上のセルからの最小パスコスト
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # 左上から (i, j) への最小パスコストを記録して返す
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """最小パス和：動的プログラミング"""
    n, m = len(grid), len(grid[0])
    # dp テーブルを初期化
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # 状態遷移：最初の行
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # 状態遷移：最初の列
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # 状態遷移：残りの行と列
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """最小パス和：空間最適化動的プログラミング"""
    n, m = len(grid), len(grid[0])
    # dp テーブルを初期化
    dp = [0] * m
    # 状態遷移：最初の行
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # 状態遷移：残りの行
    for i in range(1, n):
        # 状態遷移：最初の列
        dp[0] = dp[0] + grid[i][0]
        # 状態遷移：残りの列
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""ドライバーコード"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # ブルートフォース探索
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"左上から右下角への最小パス和は {res}")

    # 記憶化探索
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"左上から右下角への最小パス和は {res}")

    # 動的プログラミング
    res = min_path_sum_dp(grid)
    print(f"左上から右下角への最小パス和は {res}")

    # 空間最適化動的プログラミング
    res = min_path_sum_dp_comp(grid)
    print(f"左上から右下角への最小パス和は {res}")