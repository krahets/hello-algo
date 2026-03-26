"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """Подъем по лестнице: динамическое программирование"""
    if n == 1 or n == 2:
        return n
    # Инициализировать таблицу dp для хранения решений подзадач
    dp = [0] * (n + 1)
    # Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1], dp[2] = 1, 2
    # Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
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
    print(f"Для лестницы из {n} ступеней существует {res} способов подъема")

    res = climbing_stairs_dp_comp(n)
    print(f"Для лестницы из {n} ступеней существует {res} способов подъема")
