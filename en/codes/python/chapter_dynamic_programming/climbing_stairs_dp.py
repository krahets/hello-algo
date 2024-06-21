"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """Climbing stairs: Dynamic programming"""
    if n == 1 or n == 2:
        return n
    # Initialize dp table, used to store subproblem solutions
    dp = [0] * (n + 1)
    # Initial state: preset the smallest subproblem solution
    dp[1], dp[2] = 1, 2
    # State transition: gradually solve larger subproblems from smaller ones
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """Climbing stairs: Space-optimized dynamic programming"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"Climb {n} steps, there are {res} solutions in total")

    res = climbing_stairs_dp_comp(n)
    print(f"Climb {n} steps, there are {res} solutions in total")
