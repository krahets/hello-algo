"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """コイン両替：動的計画法"""
    n = len(coins)
    MAX = amt + 1
    # dp テーブルを初期化
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 状態遷移：先頭行と先頭列
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # 状態遷移: 残りの行と列
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a]
            else:
                # 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """コイン交換：空間最適化後の動的計画法"""
    n = len(coins)
    MAX = amt + 1
    # dp テーブルを初期化
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # 状態遷移
    for i in range(1, n + 1):
        # 順方向に走査する
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a]
            else:
                # 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # 動的計画法
    res = coin_change_dp(coins, amt)
    print(f"目標金額を作るのに必要な最小硬貨枚数は {res}")

    # 空間最適化後の動的計画法
    res = coin_change_dp_comp(coins, amt)
    print(f"目標金額を作るのに必要な最小硬貨枚数は {res}")
