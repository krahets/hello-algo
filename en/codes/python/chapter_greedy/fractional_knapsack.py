"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """Item"""

    def __init__(self, w: int, v: int):
        self.w = w  # Item weight
        self.v = v  # Item value


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """Greedy fractional knapsack"""
    # Create a list of items, each with a weight and a value
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # Sort by value per unit of weight, item.v / item.w, in descending order
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # Make greedy choices in a loop
    res = 0
    for item in items:
        if item.w <= cap:
            # If the whole item fits, put it in the knapsack
            res += item.v
            cap -= item.w
        else:
            # If the whole item does not fit, take a fraction of it
            res += (item.v / item.w) * cap
            # The knapsack is full, so exit the loop
            break
    return res


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # Greedy algorithm
    res = fractional_knapsack(wgt, val, cap)
    print(f"The maximum total value within the weight limit is {res}")
