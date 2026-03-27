"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """Размен монет II: динамическое программирование"""
    n = len(coins)
    # Инициализация таблицы dp
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # Инициализация первого столбца
    for i in range(n + 1):
        dp[i][0] = 1
    # Переход состояний
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a]
            else:
                # Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """Размен монет II: динамическое программирование с оптимизацией памяти"""
    n = len(coins)
    # Инициализация таблицы dp
    dp = [0] * (amt + 1)
    dp[0] = 1
    # Переход состояний
    for i in range(1, n + 1):
        # Прямой обход
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a]
            else:
                # Сумма двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # Динамическое программирование
    res = coin_change_ii_dp(coins, amt)
    print(f"Количество комбинаций монет для набора целевой суммы = {res}")

    # Динамическое программирование с оптимизацией памяти
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"Количество комбинаций монет для набора целевой суммы = {res}")
