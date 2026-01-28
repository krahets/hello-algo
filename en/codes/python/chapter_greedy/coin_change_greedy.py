"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Coin change: Greedy algorithm"""
    # Assume coins list is sorted
    i = len(coins) - 1
    count = 0
    # Loop to make greedy choices until no remaining amount
    while amt > 0:
        # Find the coin that is less than and closest to the remaining amount
        while i > 0 and coins[i] > amt:
            i -= 1
        # Choose coins[i]
        amt -= coins[i]
        count += 1
    # If no feasible solution is found, return -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # Greedy algorithm: Can guarantee finding the global optimal solution
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")

    # Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")
    print(f"Actually the minimum number needed is 3, i.e., 20 + 20 + 20")

    # Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")
    print(f"Actually the minimum number needed is 2, i.e., 49 + 49")
