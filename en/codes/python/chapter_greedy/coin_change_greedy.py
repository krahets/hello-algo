"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Greedy coin change"""
    # Assume the coins list is sorted
    i = len(coins) - 1
    count = 0
    # Make greedy choices until no amount remains
    while amt > 0:
        # Find the largest denomination that does not exceed the remaining amount
        while i > 0 and coins[i] > amt:
            i -= 1
        # Choose coins[i]
        amt -= coins[i]
        count += 1
    # Return -1 if no feasible solution was found
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # Greedy choices are guaranteed to give a global optimum here
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")

    # Greedy choices do not guarantee a global optimum here
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")
    print(f"The actual minimum is 3 coins: 20 + 20 + 20")

    # Greedy choices do not guarantee a global optimum here
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"The minimum number of coins needed to make {amt} is {res}")
    print(f"The actual minimum is 2 coins: 49 + 49")
