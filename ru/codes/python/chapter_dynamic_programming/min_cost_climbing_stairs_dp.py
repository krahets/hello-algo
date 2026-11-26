"""
File: min_cost_climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
    """Минимальная стоимость подъёма: динамическое программирование"""
    n = len(cost) - 1
    if n == 1 or n == 2:
        return cost[n]
    # Создать таблицу dp для решений подзадач
    dp = [0] * (n + 1)
    # Начальные состояния: задать решения простейших подзадач
    dp[1], dp[2] = cost[1], cost[2]
    # Переход: решать подзадачи от меньших к большим
    for i in range(3, n + 1):
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    return dp[n]


def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
    """Минимальная стоимость подъёма: динамическое программирование с экономией памяти"""
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
    print(f"Стоимость ступеней: {cost}")

    res = min_cost_climbing_stairs_dp(cost)
    print(f"Минимальная стоимость подъёма: {res}")

    res = min_cost_climbing_stairs_dp_comp(cost)
    print(f"Минимальная стоимость подъёма: {res}")
