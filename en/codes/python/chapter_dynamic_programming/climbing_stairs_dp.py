"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """Climbing stairs: dynamic programming"""
    if n == 1 or n == 2:
        return n
    # Initialize the dp table to store subproblem solutions
    dp = [0] * (n + 1)
    # Initial states: set the solutions to the smallest subproblems
    dp[1], dp[2] = 1, 2
    # State transitions: solve progressively larger subproblems using smaller ones
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """Climbing stairs: space-optimized dynamic programming"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Driver code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"Number of ways to climb {n} stairs: {res}")

    res = climbing_stairs_dp_comp(n)
    print(f"Number of ways to climb {n} stairs: {res}")
