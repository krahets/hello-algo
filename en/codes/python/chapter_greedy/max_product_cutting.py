"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """Greedy maximum product algorithm"""
    # When n <= 3, one piece must be 1
    if n <= 3:
        return 1 * (n - 1)
    # Greedily cut off pieces of size 3. Let a be their count and b the remainder
    a, b = n // 3, n % 3
    if b == 1:
        # If the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # If the remainder is 2, leave it as is
        return int(math.pow(3, a)) * 2
    # If the remainder is 0, no adjustment is needed
    return int(math.pow(3, a))


"""Driver Code"""
if __name__ == "__main__":
    n = 58

    # Greedy algorithm
    res = max_product_cutting(n)
    print(f"The maximum product after cutting is {res}")
