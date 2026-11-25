"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Размен монет: жадный алгоритм"""
    # Список coins предполагается отсортированным
    i = len(coins) - 1
    count = 0
    # Повторяем жадный выбор, пока остаток суммы не обнулится
    while amt > 0:
        # Ищем ближайший к остатку номинал среди меньших, чем остаток
        while i > 0 and coins[i] > amt:
            i -= 1
        # Берём coins[i]
        amt -= coins[i]
        count += 1
    # Если решения не нашлось, возвращаем -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Для суммы {amt} минимальное число монет: {res}")

    # Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Для суммы {amt} минимальное число монет: {res}")
    print(f"На самом деле минимум — 3 монеты: 20 + 20 + 20")

    # Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Для суммы {amt} минимальное число монет: {res}")
    print(f"На самом деле минимум — 2 монеты: 49 + 49")
