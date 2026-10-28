"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 배낭: 완전 탐색"""
    # 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 or c == 0:
        return 0
    # 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 두 경우 중 더 큰 가치를 반환한다
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 배낭: 메모이제이션을 이용한 탐색"""
    # 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 or c == 0:
        return 0
    # 기록이 이미 있으면 바로 반환한다
    if mem[i][c] != -1:
        return mem[i][c]
    # 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 두 경우 중 더 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 배낭: 동적 계획법"""
    n = len(wgt)
    # dp 테이블을 초기화한다
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 상태 전이
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            else:
                # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 배낭: 공간을 최적화한 동적 계획법"""
    n = len(wgt)
    # dp 테이블을 초기화한다
    dp = [0] * (cap + 1)
    # 상태 전이
    for i in range(1, n + 1):
        # 역방향 순회
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            else:
                # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""실행 코드"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 완전 탐색
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")

    # 메모이제이션을 이용한 탐색
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")

    # 동적 계획법
    res = knapsack_dp(wgt, val, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")

    # 공간을 최적화한 동적 계획법
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")
