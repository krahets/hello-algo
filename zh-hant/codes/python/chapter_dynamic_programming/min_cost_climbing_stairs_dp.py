"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """爬樓梯的最低成本：動態規劃"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # 初始化 dp 表，用來儲存子問題的解
    dp = [0] * (n + 1)
    # 初始狀態：設定最小子問題的解
    dp[1], dp[2] = cost[1], cost[2]
    # 狀態轉移：從較小的子問題逐步求出較大子問題的解
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """爬樓梯的最低成本：空間最佳化後的動態規劃"""
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
    print(f"輸入的各階樓梯成本為 {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"爬完樓梯的最低成本為 {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"爬完樓梯的最低成本為 {res}")
