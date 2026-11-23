"""
File: min_path_sum.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""

from math import inf


def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
    """최소 경로 합: 완전 탐색"""
    # 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if i == 0 and j == 0:
        return grid[0][0]
    # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if i < 0 or j < 0:
        return inf
    # 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    up = min_path_sum_dfs(grid, i - 1, j)
    left = min_path_sum_dfs(grid, i, j - 1)
    # 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    return min(left, up) + grid[i][j]


def min_path_sum_dfs_mem(
    grid: list[list[int]], mem: list[list[int]], i: int, j: int
) -> int:
    """최소 경로 합: 메모이제이션을 이용한 탐색"""
    # 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if i == 0 and j == 0:
        return grid[0][0]
    # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if i < 0 or j < 0:
        return inf
    # 기록이 이미 있으면 바로 반환한다
    if mem[i][j] != -1:
        return mem[i][j]
    # 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
    up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
    left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
    # 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]


def min_path_sum_dp(grid: list[list[int]]) -> int:
    """최소 경로 합: 동적 계획법"""
    n, m = len(grid), len(grid[0])
    # dp 테이블을 초기화한다
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = grid[0][0]
    # 상태 전이: 첫 번째 행
    for j in range(1, m):
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    # 상태 전이: 첫 번째 열
    for i in range(1, n):
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    # 상태 전이: 나머지 행과 열
    for i in range(1, n):
        for j in range(1, m):
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
    return dp[n - 1][m - 1]


def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
    """최소 경로 합: 공간을 최적화한 동적 계획법"""
    n, m = len(grid), len(grid[0])
    # dp 테이블을 초기화한다
    dp = [0] * m
    # 상태 전이: 첫 번째 행
    dp[0] = grid[0][0]
    for j in range(1, m):
        dp[j] = dp[j - 1] + grid[0][j]
    # 상태 전이: 나머지 행
    for i in range(1, n):
        # 상태 전이: 첫 번째 열
        dp[0] = dp[0] + grid[i][0]
        # 상태 전이: 나머지 열
        for j in range(1, m):
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
    return dp[m - 1]


"""실행 코드"""
if __name__ == "__main__":
    grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
    n, m = len(grid), len(grid[0])

    # 완전 탐색
    res = min_path_sum_dfs(grid, n - 1, m - 1)
    print(f"왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다")

    # 메모이제이션을 이용한 탐색
    mem = [[-1] * m for _ in range(n)]
    res = min_path_sum_dfs_mem(grid, mem, n - 1, m - 1)
    print(f"왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다")

    # 동적 계획법
    res = min_path_sum_dp(grid)
    print(f"왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다")

    # 공간을 최적화한 동적 계획법
    res = min_path_sum_dp_comp(grid)
    print(f"왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다")
