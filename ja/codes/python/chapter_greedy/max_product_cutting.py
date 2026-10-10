"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """最大切断積：貪欲法"""
    # n <= 3 のときは、必ず 1 を切り出す
    if n <= 3:
        return 1 * (n - 1)
    # 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
    a, b = n // 3, n % 3
    if b == 1:
        # 余りが 1 のときは、1 * 3 を 2 * 2 に変える
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # 余りが 2 のときは、そのままにする
        return int(math.pow(3, a)) * 2
    # 余りが 0 のときは、そのままにする
    return int(math.pow(3, a))


"""Driver Code"""
if __name__ == "__main__":
    n = 58

    # 貪欲法
    res = max_product_cutting(n)
    print(f"最大分割積は {res}")
