"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """Minimum path sum: brute-force search"""
    # Stop searching at the top-left cell
    if i == 0 and j == 0:
        return grid[0][0]
    # If a row or column index is out of bounds, return a cost of +∞
    if i < 0 or j < 0:
        return inf
    # Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # Return the minimum path cost from the top-left corner to (i, j)
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """Minimum path sum: memoized search"""
    # Stop searching at the top-left cell
    if i == 0 and j == 0:
        return grid[0][0]
    # If a row or column index is out of bounds, return a cost of +∞
    if i < 0 or j < 0:
        return inf
    # If a result has already been recorded, return it directly
    if mem[i][j] != -1:
        return mem[i][j]
    # Minimum path costs to the cells on the left and above
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # Record and return the minimum path cost from the top-left corner to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """Minimum path sum: dynamic programming"""
    n, m = len(grid), len(grid[0])
    # Initialize the dp table
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # State transitions: first row
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # State transitions: first column
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # State transitions: remaining rows and columns
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """Minimum path sum: space-optimized dynamic programming"""
    n, m = len(grid), len(grid[0])
    # Initialize the dp table
    dp = [0] * m
    # State transitions: first row
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # State transitions: remaining rows
    for i in range(1, n):
        # State transitions: first column
        dp[0] = dp[0] + grid[i][0]
        # State transitions: remaining columns
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""Driver code"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # Brute-force search
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"Minimum path sum from the top-left to the bottom-right corner: {res}")

    # Memoized search
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"Minimum path sum from the top-left to the bottom-right corner: {res}")

    # Dynamic programming
    res = min_path_sum_dp(grid)
    print(f"Minimum path sum from the top-left to the bottom-right corner: {res}")

    # Space-optimized dynamic programming
    res = min_path_sum_dp_comp(grid)
    print(f"Minimum path sum from the top-left to the bottom-right corner: {res}")
