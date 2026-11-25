"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """Minimum cost to climb stairs with dynamic programming"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # Initialize the dp table to store subproblem solutions
    dp = [0] * (n + 1)
    # Base cases: set the solutions to the smallest subproblems
    dp[1], dp[2] = cost[1], cost[2]
    # State transition: solve larger subproblems using smaller ones
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """Minimum cost to climb stairs with space-optimized dynamic programming"""
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
    print(f"Input stair costs: {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"Minimum cost to climb the stairs: {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"Minimum cost to climb the stairs: {res}")
