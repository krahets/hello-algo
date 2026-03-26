"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """Неограниченный рюкзак: динамическое программирование"""
    n = len(wgt)
    # Инициализировать таблицу dp
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # Переход состояния
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, не брать предмет i
                dp[i][c] = dp[i - 1][c]
            else:
                # Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """Неограниченный рюкзак: динамическое программирование с оптимизацией памяти"""
    n = len(wgt)
    # Инициализировать таблицу dp
    dp = [0] * (cap + 1)
    # Переход состояния
    for i in range(1, n + 1):
        # Прямой обход по порядку
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, не брать предмет i
                dp[c] = dp[c]
            else:
                # Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # Динамическое программирование
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {res}")

    # Динамическое программирование с оптимизацией по памяти
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {res}")
