"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """Цикл for"""
    res = 0
    # Сложить числа 1, 2, ..., n-1, n в цикле
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """Цикл while"""
    res = 0
    i = 1  # Задать начальное значение переменной условия
    # Сложить числа 1, 2, ..., n-1, n в цикле
    while i <= n:
        res += i
        i += 1  # Обновить переменную условия
    return res


def while_loop_ii(n: int) -> int:
    """Цикл while с двумя обновлениями"""
    res = 0
    i = 1  # Задать начальное значение переменной условия
    # Сложить числа 1, 4, 10, ... в цикле
    while i <= n:
        res += i
        # Обновить переменную условия
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """Вложенные циклы for"""
    res = ""
    # Перебрать i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # Перебрать j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nСумма в цикле for: res = {res}")

    res = while_loop(n)
    print(f"\nСумма в цикле while: res = {res}")

    res = while_loop_ii(n)
    print(f"\nСумма в цикле while с двумя обновлениями: res = {res}")

    res = nested_for_loop(n)
    print(f"\nРезультат обхода вложенными циклами for: {res}")
