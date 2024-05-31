"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Coin change: Greedy"""
    # Assume coins list is ordered
    i = len(coins) - 1
    count = 0
    # Loop for greedy selection until no remaining amount
    while amt > 0:
        # Find the smallest coin close to and less than the remaining amount
        while i > 0 and coins[i] > amt:
            i -= 1
        # Choose coins[i]
        amt -= coins[i]
        count += 1
    # If no feasible solution is found, return -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # Greedy: can ensure finding a global optimal solution
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make up {amt} is {res}")

    # Greedy: cannot ensure finding a global optimal solution
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make up {amt} is {res}")
    print(f"In reality, the minimum number needed is 3, i.e., 20 + 20 + 20")

    # Greedy: cannot ensure finding a global optimal solution
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make up {amt} is {res}")
    print(f"In reality, the minimum number needed is 2, i.e., 49 + 49")
