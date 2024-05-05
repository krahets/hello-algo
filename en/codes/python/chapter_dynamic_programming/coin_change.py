"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """Coin change: Dynamic programming"""
    n = len(coins)
    MAX = amt + 1
    # Initialize dp table
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # State transition: first row and first column
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # State transition: the rest of the rows and columns
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If exceeding the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a]
            else:
                # The smaller value between not choosing and choosing coin i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """Coin change: Space-optimized dynamic programming"""
    n = len(coins)
    MAX = amt + 1
    # Initialize dp table
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # State transition
    for i in range(1, n + 1):
        # Traverse in order
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If exceeding the target amount, do not choose coin i
                dp[a] = dp[a]
            else:
                # The smaller value between not choosing and choosing coin i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # Dynamic programming
    res = coin_change_dp(coins, amt)
    print(f"Minimum number of coins required to reach the target amount = {res}")

    # Space-optimized dynamic programming
    res = coin_change_dp_comp(coins, amt)
    print(f"Minimum number of coins required to reach the target amount = {res}")
