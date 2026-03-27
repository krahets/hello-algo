"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """Цикл for"""
    res = 0
    # Циклическое суммирование 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """Цикл while"""
    res = 0
    i = 1  # Инициализация условной переменной
    # Циклическое суммирование 1, 2, ..., n-1, n
    while i <= n:
        res += i
        i += 1  # Обновить условную переменную
    return res


def while_loop_ii(n: int) -> int:
    """Цикл while (двойное обновление)"""
    res = 0
    i = 1  # Инициализация условной переменной
    # Циклическое суммирование 1, 4, 10, ...
    while i <= n:
        res += i
        # Обновить условную переменную
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """Двойной цикл for"""
    res = ""
    # Цикл по i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # Цикл по j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nРезультат суммирования в цикле for res = {res}")

    res = while_loop(n)
    print(f"\nРезультат суммирования в цикле while res = {res}")

    res = while_loop_ii(n)
    print(f"\nРезультат суммирования в цикле while (двойное обновление) res = {res}")

    res = nested_for_loop(n)
    print(f"\nРезультат обхода в двойном цикле for {res}")
