"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """Climbing stairs with minimum cost: Dynamic programming"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # Initialize dp table, used to store subproblem solutions
    dp = [0] * (n + 1)
    # Initial state: preset the smallest subproblem solution
    dp[1], dp[2] = cost[1], cost[2]
    # State transition: gradually solve larger subproblems from smaller ones
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """Climbing stairs with minimum cost: Space-optimized dynamic programming"""
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
    print(f"Enter the list of stair costs as {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"Minimum cost to climb the stairs {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"Minimum cost to climb the stairs {res}")
