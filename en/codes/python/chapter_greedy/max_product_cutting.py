"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """Maximum product of cutting: Greedy"""
    # When n <= 3, must cut out a 1
    if n <= 3:
        return 1 * (n - 1)
    # Greedy cut out 3s, a is the number of 3s, b is the remainder
    a, b = n // 3, n % 3
    if b == 1:
        # When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # When the remainder is 2, do nothing
        return int(math.pow(3, a)) * 2
    # When the remainder is 0, do nothing
    return int(math.pow(3, a))


"""Driver Code"""
if __name__ == "__main__":
    n = 58

    # Greedy algorithm
    res = max_product_cutting(n)
    print(f"Maximum product of cutting is {res}")
