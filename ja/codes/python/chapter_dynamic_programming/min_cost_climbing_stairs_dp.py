"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """階段登りの最小コスト：動的計画法"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # 部分問題の解を保存するために dp テーブルを初期化
    dp = [0] * (n + 1)
    # 初期状態：最小部分問題の解をあらかじめ設定
    dp[1], dp[2] = cost[1], cost[2]
    # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """階段昇りの最小コスト：空間最適化後の動的計画法"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    a, b = cost[1], cost[2]
    for i in range(3, n + 1):
        a, b = b, min(a, b) + cost[i]
    return b


"""Driver Code"""
if __name__ == "__main__":
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    print(f"入力された階段コストのリストは {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"階段を上り切る最小コストは {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"階段を上り切る最小コストは {res}")
