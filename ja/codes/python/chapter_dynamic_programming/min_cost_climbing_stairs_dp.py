"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """階段を上る最小コスト：動的計画法"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # 部分問題の解を格納する dp テーブルを初期化する
    dp = [0] * (n + 1)
    # 初期状態：最小の部分問題の解を設定する
    dp[1], dp[2] = cost[1], cost[2]
    # 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """階段を上る最小コスト：空間を最適化した動的計画法"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    a, b = cost[1], cost[2]
    for i in range(3, n + 1):
        a, b = b, min(a, b) + cost[i]
    return b


"""実行用コード"""
if __name__ == "__main__":
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    print(f"入力した階段のコストのリストは {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"階段を上り終える最小コストは {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"階段を上り終える最小コストは {res}")
