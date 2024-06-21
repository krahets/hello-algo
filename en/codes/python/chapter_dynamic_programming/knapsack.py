"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 Knapsack: Brute force search"""
    # If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if i == 0 or c == 0:
        return 0
    # If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # Calculate the maximum value of not putting in and putting in item i
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Return the greater value of the two options
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 Knapsack: Memoized search"""
    # If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if i == 0 or c == 0:
        return 0
    # If there is a record, return it
    if mem[i][c] != -1:
        return mem[i][c]
    # If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # Calculate the maximum value of not putting in and putting in item i
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Record and return the greater value of the two options
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 Knapsack: Dynamic programming"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 Knapsack: Space-optimized dynamic programming"""
    n = len(wgt)
    # Initialize dp table
    dp = [0] * (cap + 1)
    # State transition
    for i in range(1, n + 1):
        # Traverse in reverse order
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # If exceeding the knapsack capacity, do not choose item i
                dp[c] = dp[c]
            else:
                # The greater value between not choosing and choosing item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # Brute force search
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")

    # Memoized search
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")

    # Dynamic programming
    res = knapsack_dp(wgt, val, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")

    # Space-optimized dynamic programming
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"The maximum item value without exceeding knapsack capacity is {res}")
