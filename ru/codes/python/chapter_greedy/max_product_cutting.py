"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """Максимальное произведение разбиения: жадный алгоритм"""
    # Когда n <= 3, необходимо отделить одну 1
    if n <= 3:
        return 1 * (n - 1)
    # Жадно выделить части по 3, где a — число троек, а b — остаток
    a, b = n // 3, n % 3
    if b == 1:
        # Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # Когда остаток равен 2, ничего делать не нужно
        return int(math.pow(3, a)) * 2
    # Когда остаток равен 0, ничего делать не нужно
    return int(math.pow(3, a))


"""Driver Code"""
if __name__ == "__main__":
    n = 58

    # Жадный алгоритм
    res = max_product_cutting(n)
    print(f"максимальное произведение разбиенияравно {res}")
