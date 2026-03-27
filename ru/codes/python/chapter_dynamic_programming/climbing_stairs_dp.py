"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """Подъем по лестнице: динамическое программирование"""
    if n == 1 or n == 2:
        return n
    # Инициализация таблицы dp для хранения решений подзадач
    dp = [0] * (n + 1)
    # Начальное состояние: заранее задать решения наименьших подзадач
    dp[1], dp[2] = 1, 2
    # Переход состояний: постепенное решение больших подзадач через меньшие
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """Подъем по лестнице: динамическое программирование с оптимизацией памяти"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"Количество способов подняться по лестнице из {n} ступеней = {res}")

    res = climbing_stairs_dp_comp(n)
    print(f"Количество способов подняться по лестнице из {n} ступеней = {res}")
