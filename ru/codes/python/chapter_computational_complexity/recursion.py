"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """Рекурсия"""
    # Условие остановки
    if n == 1:
        return 1
    # Спуск: рекурсивный вызов
    res = recur(n - 1)
    # Возврат: передача результата
    return n + res


def for_loop_recur(n: int) -> int:
    """Моделирование рекурсии с помощью итерации"""
    # Смоделировать стек вызовов с помощью явного стека
    stack = []
    res = 0
    # Спуск: рекурсивный вызов
    for i in range(n, 0, -1):
        # Добавление в стек моделирует спуск
        stack.append(i)
    # Возврат: передача результата
    while stack:
        # Извлечение из стека моделирует возврат
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """Хвостовая рекурсия"""
    # Условие остановки
    if n == 0:
        return res
    # Хвостовой рекурсивный вызов
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """Числа Фибоначчи: рекурсия"""
    # Базовые случаи: f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # Вернуть результат f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\nСумма при рекурсии: res = {res}")

    res = for_loop_recur(n)
    print(f"\nСумма при итеративном моделировании рекурсии: res = {res}")

    res = tail_recur(n, 0)
    print(f"\nСумма при хвостовой рекурсии: res = {res}")

    res = fib(n)
    print(f"\nЧисло Фибоначчи с номером {n} равно {res}")
