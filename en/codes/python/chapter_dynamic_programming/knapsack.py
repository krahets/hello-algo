"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 knapsack: brute-force search"""
    # If all items have been considered or no capacity remains, return value 0
    if i == 0 or c == 0:
        return 0
    # If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # Calculate the maximum values obtained by excluding and including item i
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Return the larger value from the two choices
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 knapsack: memoized search"""
    # If all items have been considered or no capacity remains, return value 0
    if i == 0 or c == 0:
        return 0
    # If a result has already been recorded, return it directly
    if mem[i][c] != -1:
        return mem[i][c]
    # If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # Calculate the maximum values obtained by excluding and including item i
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # Record and return the larger value from the two choices
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 knapsack: dynamic programming"""
    n = len(wgt)
    # Initialize the dp table
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # State transitions
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c]
            else:
                # Take the larger value obtained by excluding and including item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 knapsack: space-optimized dynamic programming"""
    n = len(wgt)
    # Initialize the dp table
    dp = [0] * (cap + 1)
    # State transitions
    for i in range(1, n + 1):
        # Traverse in decreasing order
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # If item i exceeds the remaining capacity, do not choose it
                dp[c] = dp[c]
            else:
                # Take the larger value obtained by excluding and including item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # Brute-force search
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"Maximum total value within the knapsack capacity: {res}")

    # Memoized search
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"Maximum total value within the knapsack capacity: {res}")

    # Dynamic programming
    res = knapsack_dp(wgt, val, cap)
    print(f"Maximum total value within the knapsack capacity: {res}")

    # Space-optimized dynamic programming
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"Maximum total value within the knapsack capacity: {res}")
