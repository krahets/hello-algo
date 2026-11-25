"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """Размен монет: динамическое программирование"""
    n = len(coins)
    MAX = amt + 1
    # Инициализировать таблицу dp
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # Переход: первая строка и первый столбец
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # Переход: остальные строки и столбцы
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a]
            else:
                # Взять минимум из двух вариантов: без монеты i и с ней
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """Размен монет: динамическое программирование с экономией памяти"""
    n = len(coins)
    MAX = amt + 1
    # Инициализировать таблицу dp
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # Переход между состояниями
    for i in range(1, n + 1):
        # Обход в прямом порядке
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a]
            else:
                # Взять минимум из двух вариантов: без монеты i и с ней
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # Динамическое программирование
    res = coin_change_dp(coins, amt)
    print(f"Минимальное число монет для заданной суммы: {res}")

    # Динамическое программирование с экономией памяти
    res = coin_change_dp_comp(coins, amt)
    print(f"Минимальное число монет для заданной суммы: {res}")
