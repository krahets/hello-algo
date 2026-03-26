"""
File: coin_change_greedy.py
Created Time: 2023-07-18
Author: krahets (krahets@163.com)
"""


def coin_change_greedy(coins: list[int], amt: int) -> int:
    """Размен монет: жадный алгоритм"""
    # Предположим, что список coins упорядочен
    i = len(coins) - 1
    count = 0
    # Повторять жадный выбор, пока не останется суммы
    while amt > 0:
        # Найти монету, которая меньше оставшейся суммы и ближе всего к ней
        while i > 0 and coins[i] > amt:
            i -= 1
        # Выбрать coins[i]
        amt -= coins[i]
        count += 1
    # Если допустимое решение не найдено, вернуть -1
    return count if amt == 0 else -1


"""Driver Code"""
if __name__ == "__main__":
    # Жадный подход: позволяет гарантированно найти глобально оптимальное решение
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Минимальное число монет для набора суммы {amt} равно {res}")

    # Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = [1, 20, 50]
    amt = 60
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Минимальное число монет для набора суммы {amt} равно {res}")
    print(f"Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20")

    # Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = [1, 49, 50]
    amt = 98
    res = coin_change_greedy(coins, amt)
    print(f"\ncoins = {coins}, amt = {amt}")
    print(f"Минимальное число монет для набора суммы {amt} равно {res}")
    print(f"Фактически минимальное необходимое количество равно 2, то есть 49 + 49")
