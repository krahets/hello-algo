"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """동전 교환: 동적 계획법"""
    n = len(coins)
    MAX = amt + 1
    # dp 테이블을 초기화한다
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 상태 전이: 첫 번째 행과 첫 번째 열
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # 상태 전이: 나머지 행과 열
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            else:
                # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """동전 교환: 공간을 최적화한 동적 계획법"""
    n = len(coins)
    MAX = amt + 1
    # dp 테이블을 초기화한다
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # 상태 전이
    for i in range(1, n + 1):
        # 정방향 순회
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            else:
                # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""실행 코드"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # 동적 계획법
    res = coin_change_dp(coins, amt)
    print(f"목표 금액을 만드는 데 필요한 최소 동전 개수는 {res}개이다")

    # 공간을 최적화한 동적 계획법
    res = coin_change_dp_comp(coins, amt)
    print(f"목표 금액을 만드는 데 필요한 최소 동전 개수는 {res}개이다")
