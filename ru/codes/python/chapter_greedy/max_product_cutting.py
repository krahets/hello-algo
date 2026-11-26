"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """Максимальное произведение при разбиении: жадный алгоритм"""
    # При n <= 3 одно из слагаемых обязательно равно 1
    if n <= 3:
        return 1 * (n - 1)
    # Выделяем тройки жадно: a — число троек, b — остаток
    a, b = n // 3, n % 3
    if b == 1:
        # При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # При остатке 2 ничего не меняем
        return int(math.pow(3, a)) * 2
    # При остатке 0 ничего не меняем
    return int(math.pow(3, a))


"""Driver Code"""
if __name__ == "__main__":
    n = 58

    # Жадный алгоритм
    res = max_product_cutting(n)
    print(f"Максимальное произведение при разбиении: {res}")
