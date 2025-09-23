"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """最小コスト階段登り：動的プログラミング"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # dp テーブルを初期化、部分問題の解を格納するために使用
    dp = [0] * (n + 1)
    # 初期状態：最小の部分問題の解を事前設定
    dp[1], dp[2] = cost[1], cost[2]
    # 状態遷移：小さい部分問題から大きい部分問題を段階的に解く
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """最小コスト階段登り：空間最適化動的プログラミング"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    a, b = cost[1], cost[2]
    for i in range(3, n + 1):
        a, b = b, min(a, b) + cost[i]
    return b


"""ドライバーコード"""
if __name__ == "__main__":
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    print(f"階段コストリストの入力：{cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"階段を登る最小コスト {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"階段を登る最小コスト {res}")