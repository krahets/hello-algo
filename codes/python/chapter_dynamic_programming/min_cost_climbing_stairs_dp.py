"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: Krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """爬楼梯最小代价：动态规划"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # 初始化 dp 表，用于存储子问题的解
    dp = [0] * (n + 1)
    # 初始状态：预设最小子问题的解
    dp[1], dp[2] = cost[1], cost[2]
    # 状态转移：从较小子问题逐步求解较大子问题
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """爬楼梯最小代价：空间优化后的动态规划"""
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
    print(f"输入楼梯的代价列表为 {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"爬完楼梯的最低代价为 {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"爬完楼梯的最低代价为 {res}")
