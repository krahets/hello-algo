"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """Coin change: dynamic programming"""
    n = len(coins)
    MAX = amt + 1
    # Initialize the dp table
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # State transitions: first row and first column
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # State transitions: remaining rows and columns
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If the coin value exceeds the current amount a, do not choose coin i
                dp[i][a] = dp[i - 1][a]
            else:
                # Take the smaller result of not choosing and choosing coin i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """Coin change: space-optimized dynamic programming"""
    n = len(coins)
    MAX = amt + 1
    # Initialize the dp table
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # State transitions
    for i in range(1, n + 1):
        # Traverse in increasing order
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # If the coin value exceeds the current amount a, do not choose coin i
                dp[a] = dp[a]
            else:
                # Take the smaller result of not choosing and choosing coin i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""Driver code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # Dynamic programming
    res = coin_change_dp(coins, amt)
    print(f"Minimum number of coins needed to make the target amount: {res}")

    # Space-optimized dynamic programming
    res = coin_change_dp_comp(coins, amt)
    print(f"Minimum number of coins needed to make the target amount: {res}")
