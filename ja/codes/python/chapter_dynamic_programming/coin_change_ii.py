"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """硬貨の両替 II：動的計画法"""
    n = len(coins)
    # dp テーブルを初期化する
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 先頭列を初期化する
    for i in range(n + 1):
        dp[i][0] = 1
    # 状態遷移
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合は硬貨 i を使わない
                dp[i][a] = dp[i - 1][a]
            else:
                # 硬貨 i を使わない場合と使う場合の組合せ数を足す
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """硬貨の両替 II：使用メモリを削減した動的計画法"""
    n = len(coins)
    # dp テーブルを初期化する
    dp = [0] * (amt + 1)
    dp[0] = 1
    # 状態遷移
    for i in range(1, n + 1):
        # 昇順に走査する
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合は硬貨 i を使わない
                dp[a] = dp[a]
            else:
                # 硬貨 i を使わない場合と使う場合の組合せ数を足す
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # 動的計画法
    res = coin_change_ii_dp(coins, amt)
    print(f"目標金額を作る硬貨の組合せ数は {res}")

    # 使用メモリを削減した動的計画法
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"目標金額を作る硬貨の組合せ数は {res}")
