"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Coin change: greedy algorithm"""
    # Assume the coins list is sorted
    i = len(coins) - 1
    count = 0
    # Repeatedly make greedy choices until no amount remains
    while amt > 0:
        # Find the largest coin no greater than the remaining amount
        while i > 0 and coins[i] > amt:
            i -= 1
        # Choose coins[i]
        amt -= coins[i]
        count += 1
    # Return -1 if no feasible solution was found
    return count if amt == 0 else -1


"""Driver code"""
if __name__ == "__main__":
    # Greedy algorithm: guaranteed to find a globally optimal solution
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Number of coins chosen by the greedy algorithm for amount {amt}: {res}")

    # Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Number of coins chosen by the greedy algorithm for amount {amt}: {res}")
    print(f"The actual minimum is 3 coins: 20 + 20 + 20")

    # Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Number of coins chosen by the greedy algorithm for amount {amt}: {res}")
    print(f"The actual minimum is 2 coins: 49 + 49")
