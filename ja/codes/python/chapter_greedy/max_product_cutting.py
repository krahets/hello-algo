"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """切断の最大積：貪欲法"""
    # n <= 3 の場合、1 を切り出す必要がある
    if n <= 3:
        return 1 * (n - 1)
    # 貪欲的に 3 を切り出す、a は 3 の個数、b は余り
    a, b = n // 3, n % 3
    if b == 1:
        # 余りが 1 の場合、1 * 3 のペアを 2 * 2 に変換
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # 余りが 2 の場合、何もしない
        return int(math.pow(3, a)) * 2
    # 余りが 0 の場合、何もしない
    return int(math.pow(3, a))


"""ドライバーコード"""
if __name__ == "__main__":
    n = 58

    # 貪欲アルゴリズム
    res = max_product_cutting(n)
    print(f"切断の最大積は {res}")