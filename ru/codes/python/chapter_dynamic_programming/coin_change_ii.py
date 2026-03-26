"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """Размен монет II: динамическое программирование"""
    n = len(coins)
    # Инициализировать таблицу dp
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # Инициализировать первый столбец
    for i in range(n + 1):
        dp[i][0] = 1
    # Переход состояния
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a]
            else:
                # Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """Размен монет II: динамическое программирование с оптимизацией памяти"""
    n = len(coins)
    # Инициализировать таблицу dp
    dp = [0] * (amt + 1)
    dp[0] = 1
    # Переход состояния
    for i in range(1, n + 1):
        # Прямой обход по порядку
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a]
            else:
                # Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # Динамическое программирование
    res = coin_change_ii_dp(coins, amt)
    print(f"Количество комбинаций монет для получения целевой суммы равно {res}")

    # Динамическое программирование с оптимизацией по памяти
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"Количество комбинаций монет для получения целевой суммы равно {res}")
