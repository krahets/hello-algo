"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """Minimum path sum: Brute force search"""
    # If it's the top-left cell, terminate the search
    if i == 0 and j == 0:
        return grid[0][0]
    # If the row or column index is out of bounds, return a +∞ cost
    if i < 0 or j < 0:
        return inf
    # Calculate the minimum path cost from the top-left to (i-1, j) and (i, j-1)
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # Return the minimum path cost from the top-left to (i, j)
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """Minimum path sum: Memoized search"""
    # If it's the top-left cell, terminate the search
    if i == 0 and j == 0:
        return grid[0][0]
    # If the row or column index is out of bounds, return a +∞ cost
    if i < 0 or j < 0:
        return inf
    # If there is a record, return it
    if mem[i][j] != -1:
        return mem[i][j]
    # The minimum path cost from the left and top cells
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # Record and return the minimum path cost from the top-left to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """Minimum path sum: Dynamic programming"""
    n, m = len(grid), len(grid[0])
    # Initialize dp table
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # State transition: first row
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # State transition: first column
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # State transition: the rest of the rows and columns
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """Minimum path sum: Space-optimized dynamic programming"""
    n, m = len(grid), len(grid[0])
    # Initialize dp table
    dp = [0] * m
    # State transition: first row
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # State transition: the rest of the rows
    for i in range(1, n):
        # State transition: first column
        dp[0] = dp[0] + grid[i][0]
        # State transition: the rest of the columns
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""Driver Code"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # Brute force search
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"The minimum path sum from the top-left to the bottom-right corner is {res}")

    # Memoized search
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"The minimum path sum from the top-left to the bottom-right corner is {res}")

    # Dynamic programming
    res = min_path_sum_dp(grid)
    print(f"The minimum path sum from the top-left to the bottom-right corner is {res}")

    # Space-optimized dynamic programming
    res = min_path_sum_dp_comp(grid)
    print(f"The minimum path sum from the top-left to the bottom-right corner is {res}")
