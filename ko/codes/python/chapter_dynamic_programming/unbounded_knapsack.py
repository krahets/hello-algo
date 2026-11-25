"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """무한 배낭: 동적 계획법"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """무한 배낭: 공간 최적화 동적 계획법"""
    n = len(wgt)
    # dp 테이블 초기화
    dp = [0] * (cap + 1)
    # 상태 전이
    for i in range(1, n + 1):
        # 정순으로 순회
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            else:
                # 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 동적 계획법
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")

    # 공간 최적화 동적 계획법
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"배낭 용량 내에서 얻는 최대 가치: {res}")
