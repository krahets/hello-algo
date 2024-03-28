"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """最小路徑和：暴力搜尋"""
    # 若為左上角單元格，則終止搜尋
    if i == 0 and j == 0:
        return grid[0][0]
    # 若行列索引越界，則返回 +∞ 代價
    if i < 0 or j < 0:
        return inf
    # 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # 返回從左上角到 (i, j) 的最小路徑代價
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """最小路徑和：記憶化搜尋"""
    # 若為左上角單元格，則終止搜尋
    if i == 0 and j == 0:
        return grid[0][0]
    # 若行列索引越界，則返回 +∞ 代價
    if i < 0 or j < 0:
        return inf
    # 若已有記錄，則直接返回
    if mem[i][j] != -1:
        return mem[i][j]
    # 左邊和上邊單元格的最小路徑代價
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """最小路徑和：動態規劃"""
    n, m = len(grid), len(grid[0])
    # 初始化 dp 表
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # 狀態轉移：首行
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # 狀態轉移：首列
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # 狀態轉移：其餘行和列
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """最小路徑和：空間最佳化後的動態規劃"""
    n, m = len(grid), len(grid[0])
    # 初始化 dp 表
    dp = [0] * m
    # 狀態轉移：首行
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # 狀態轉移：其餘行
    for i in range(1, n):
        # 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0]
        # 狀態轉移：其餘列
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""Driver Code"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # 暴力搜尋
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"從左上角到右下角的做小路徑和為 {res}")

    # 記憶化搜尋
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"從左上角到右下角的做小路徑和為 {res}")

    # 動態規劃
    res = min_path_sum_dp(grid)
    print(f"從左上角到右下角的做小路徑和為 {res}")

    # 空間最佳化後的動態規劃
    res = min_path_sum_dp_comp(grid)
    print(f"從左上角到右下角的做小路徑和為 {res}")
