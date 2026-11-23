"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """Рекурсия"""
    # Условие завершения
    if n == 1:
        return 1
    # Рекурсия: рекурсивный вызов
    res = recur(n - 1)
    # Возврат: вернуть результат
    return n + res


def for_loop_recur(n: int) -> int:
    """Имитация рекурсии итерацией"""
    # Использовать явный стек для имитации системного стека вызовов
    stack = []
    res = 0
    # Рекурсия: рекурсивный вызов
    for i in range(n, 0, -1):
        # Имитировать «рекурсию» с помощью операции помещения в стек
        stack.append(i)
    # Возврат: вернуть результат
    while stack:
        # Имитировать «возврат» с помощью операции извлечения из стека
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """Хвостовая рекурсия"""
    # Условие завершения
    if n == 0:
        return res
    # Хвостовой рекурсивный вызов
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """Последовательность Фибоначчи: рекурсия"""
    # Условие завершения: f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # Вернуть результат f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\nРезультат суммирования в рекурсивной функции res = {res}")

    res = for_loop_recur(n)
    print(f"\nРезультат суммирования при имитации рекурсии res = {res}")

    res = tail_recur(n, 0)
    print(f"\nРезультат суммирования в хвостовой рекурсии res = {res}")

    res = fib(n)
    print(f"\nЧлен последовательности Фибоначчи с номером {n} = {res}")
