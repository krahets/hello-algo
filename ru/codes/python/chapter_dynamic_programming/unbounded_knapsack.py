"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """Полный рюкзак: динамическое программирование"""
    n = len(wgt)
    # Инициализация таблицы dp
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # Переход состояний
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c]
            else:
                # Большее из двух решений: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """Полный рюкзак: динамическое программирование с оптимизацией памяти"""
    n = len(wgt)
    # Инициализация таблицы dp
    dp = [0] * (cap + 1)
    # Переход состояний
    for i in range(1, n + 1):
        # Прямой обход
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c]
            else:
                # Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # Динамическое программирование
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")

    # Динамическое программирование с оптимизацией памяти
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"Максимальная стоимость предметов без превышения вместимости рюкзака = {res}")
