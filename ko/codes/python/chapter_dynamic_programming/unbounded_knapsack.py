"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """무한 배낭: 동적 계획법"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """무한 배낭: 공간을 최적화한 동적 계획법"""
    n = len(wgt)
    # dp 테이블을 초기화한다
    dp = [0] * (cap + 1)
    # 상태 전이
    for i in range(1, n + 1):
        # 정방향 순회
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            else:
                # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""실행 코드"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 동적 계획법
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")

    # 공간을 최적화한 동적 계획법
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")
