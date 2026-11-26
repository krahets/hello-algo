"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 배낭: 완전 탐색"""
    # 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 or c == 0:
        return 0
    # 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 두 경우 중 큰 가치를 반환한다
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 배낭: 메모이제이션 탐색"""
    # 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 or c == 0:
        return 0
    # 기록이 있으면 바로 반환한다
    if mem[i][c] != -1:
        return mem[i][c]
    # 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 배낭: 동적 계획법"""
    n = len(wgt)
    # dp 테이블 초기화
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 상태 전이
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            else:
                # 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 배낭: 공간 최적화 동적 계획법"""
    n = len(wgt)
    # dp 테이블 초기화
    dp = [0] * (cap + 1)
    # 상태 전이
    for i in range(1, n + 1):
        # 역순으로 순회
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            else:
                # 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 완전 탐색
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")

    # 메모이제이션 탐색
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")

    # 동적 계획법
    res = knapsack_dp(wgt, val, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")

    # 공간 최적화 동적 계획법
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")
