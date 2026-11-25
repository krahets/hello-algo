"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """동전 교환 II: 동적 계획법"""
    n = len(coins)
    # dp 테이블 초기화
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 첫 열 초기화
    for i in range(n + 1):
        dp[i][0] = 1
    # 상태 전이
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            else:
                # 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """동전 교환 II: 공간 최적화 동적 계획법"""
    n = len(coins)
    # dp 테이블 초기화
    dp = [0] * (amt + 1)
    dp[0] = 1
    # 상태 전이
    for i in range(1, n + 1):
        # 정순으로 순회
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            else:
                # 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # 동적 계획법
    res = coin_change_ii_dp(coins, amt)
    print(f"목표 금액을 만드는 동전 조합 수: {res}")

    # 공간 최적화 동적 계획법
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"목표 금액을 만드는 동전 조합 수: {res}")
