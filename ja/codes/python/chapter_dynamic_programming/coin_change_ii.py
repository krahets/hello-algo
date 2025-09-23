"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """硬貨交換 II：動的プログラミング"""
    n = len(coins)
    # dp テーブルを初期化
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 最初の列を初期化
    for i in range(n + 1):
        dp[i][0] = 1
    # 状態遷移
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合、硬貨 i を選択しない
                dp[i][a] = dp[i - 1][a]
            else:
                # 硬貨 i を選択しないのと選択するのとの両方の選択肢の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """硬貨交換 II：空間最適化動的プログラミング"""
    n = len(coins)
    # dp テーブルを初期化
    dp = [0] * (amt + 1)
    dp[0] = 1
    # 状態遷移
    for i in range(1, n + 1):
        # 順序で走査
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合、硬貨 i を選択しない
                dp[a] = dp[a]
            else:
                # 硬貨 i を選択しないのと選択するのとの両方の選択肢の和
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""ドライバーコード"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # 動的プログラミング
    res = coin_change_ii_dp(coins, amt)
    print(f"目標金額を構成する硬貨の組み合わせ数は {res}")

    # 空間最適化動的プログラミング
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"目標金額を構成する硬貨の組み合わせ数は {res}")