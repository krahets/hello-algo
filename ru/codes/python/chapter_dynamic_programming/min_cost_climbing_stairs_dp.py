"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """Минимальная стоимость подъема по лестнице: динамическое программирование"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # Инициализация таблицы dp для хранения решений подзадач
    dp = [0] * (n + 1)
    # Начальное состояние: заранее задать решения наименьших подзадач
    dp[1], dp[2] = cost[1], cost[2]
    # Переход состояний: постепенное решение больших подзадач через меньшие
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    a, b = cost[1], cost[2]
    for i in range(3, n + 1):
        a, b = b, min(a, b) + cost[i]
    return b


"""Driver Code"""
if __name__ == "__main__":
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    print(f"Список стоимостей ступеней = {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"Минимальная стоимость подъема по лестнице = {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"Минимальная стоимость подъема по лестнице = {res}")
