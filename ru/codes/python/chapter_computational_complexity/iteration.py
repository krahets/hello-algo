"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """Цикл for"""
    res = 0
    # В цикле вычислить сумму 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """Цикл while"""
    res = 0
    i = 1  # Инициализировать управляющую переменную
    # В цикле вычислить сумму 1, 2, ..., n-1, n
    while i <= n:
        res += i
        i += 1  # Обновить управляющую переменную
    return res


def while_loop_ii(n: int) -> int:
    """Цикл while (с двумя обновлениями)"""
    res = 0
    i = 1  # Инициализировать управляющую переменную
    # В цикле вычислить сумму 1, 4, 10, ...
    while i <= n:
        res += i
        # Обновить управляющую переменную
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """Двойной цикл for"""
    res = ""
    # Цикл i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # Цикл j = 1, 2, ..., n-1, n
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
    print(f"\nЦикл while (с двумя обновлениями)результат суммирования res = {res}")

    res = nested_for_loop(n)
    print(f"\nРезультат обхода двойным циклом for {res}")
