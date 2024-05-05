"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """Complete knapsack: Dynamic programming"""
    n = len(wgt)
    # Initialize dp table
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # State transition
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c]
            else:
                # The greater value between not choosing and choosing item i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """Complete knapsack: Space-optimized dynamic programming"""
    n = len(wgt)
    # Initialize dp table
    dp = [0] * (cap + 1)
    # State transition
    for i in range(1, n + 1):
        # Traverse in order
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # If exceeding the knapsack capacity, do not choose item i
                dp[c] = dp[c]
            else:
                # The greater value between not choosing and choosing item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # Dynamic programming
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")

    # Space-optimized dynamic programming
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")
