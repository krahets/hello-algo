"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """Coin change II: dynamic programming"""
    n = len(coins)
    # Initialize the dp table
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # Initialize the first column
    for i in range(n + 1):
        dp[i][0] = 1
    # State transitions
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If the coin value exceeds the current amount a, do not choose coin i
                dp[i][a] = dp[i - 1][a]
            else:
                # Add the numbers of ways without and with coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """Coin change II: space-optimized dynamic programming"""
    n = len(coins)
    # Initialize the dp table
    dp = [0] * (amt + 1)
    dp[0] = 1
    # State transitions
    for i in range(1, n + 1):
        # Traverse in increasing order
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If the coin value exceeds the current amount a, do not choose coin i
                dp[a] = dp[a]
            else:
                # Add the numbers of ways without and with coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # Dynamic programming
    res = coin_change_ii_dp(coins, amt)
    print(f"Number of coin combinations that make the target amount: {res}")

    # Space-optimized dynamic programming
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"Number of coin combinations that make the target amount: {res}")
