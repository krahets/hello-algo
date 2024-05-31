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
    """Fractional knapsack: Greedy"""
    # Create an item list, containing two properties: weight, value
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # Sort by unit value item.v / item.w from high to low
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # Loop for greedy selection
    res = 0
    for item in items:
        if item.w <= cap:
            # If the remaining capacity is sufficient, put the entire item into the knapsack
            res += item.v
            cap -= item.w
        else:
            # If the remaining capacity is insufficient, put part of the item into the knapsack
            res += (item.v / item.w) * cap
            # No remaining capacity left, thus break the loop
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
    print(f"The maximum item value without exceeding knapsack capacity is {res}")
