"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """硬貨交換：動的プログラミング"""
    n = len(coins)
    MAX = amt + 1
    # dp テーブルを初期化
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 状態遷移：最初の行と最初の列
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # 状態遷移：残りの行と列
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合、硬貨 i を選択しない
                dp[i][a] = dp[i - 1][a]
            else:
                # 硬貨 i を選択しないのと選択するのとで小さい値
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """硬貨交換：空間最適化動的プログラミング"""
    n = len(coins)
    MAX = amt + 1
    # dp テーブルを初期化
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # 状態遷移
    for i in range(1, n + 1):
        # 順序で走査
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超える場合、硬貨 i を選択しない
                dp[a] = dp[a]
            else:
                # 硬貨 i を選択しないのと選択するのとで小さい値
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""ドライバーコード"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # 動的プログラミング
    res = coin_change_dp(coins, amt)
    print(f"目標金額に到達するのに必要な硬貨の最小数 = {res}")

    # 空間最適化動的プログラミング
    res = coin_change_dp_comp(coins, amt)
    print(f"目標金額に到達するのに必要な硬貨の最小数 = {res}")