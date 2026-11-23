"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """Постоянная сложность"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """Линейная сложность"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """Линейная сложность (обход массива)"""
    count = 0
    # Число итераций пропорционально длине массива
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Квадратичная сложность"""
    count = 0
    # Число итераций квадратично зависит от размера данных n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Квадратичная сложность (пузырьковая сортировка)"""
    count = 0  # Счетчик
    # Внешний цикл: неотсортированный диапазон [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Поменять местами nums[j] и nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Обмен элементов включает 3 элементарные операции
    return count


def exponential(n: int) -> int:
    """Экспоненциальная сложность (итеративная реализация)"""
    count = 0
    base = 1
    # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """Экспоненциальная сложность (рекурсивная реализация)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """Логарифмическая сложность (итеративная реализация)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """Логарифмическая сложность (рекурсивная реализация)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """Линейно-логарифмическая сложность"""
    if n <= 1:
        return 1
    # Разделение надвое: размер подзадачи уменьшается вдвое
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # Текущая подзадача содержит n операций
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Факториальная сложность (рекурсивная реализация)"""
    if n == 0:
        return 1
    count = 0
    # Из одного получается n
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
    n = 8
    print("Размер входных данных n =", n)

    count = constant(n)
    print("Число операций константной сложности =", count)

    count = linear(n)
    print("Число операций линейной сложности =", count)
    count = array_traversal([0] * n)
    print("Число операций линейной сложности (обход массива) =", count)

    count = quadratic(n)
    print("Число операций квадратичной сложности =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("Число операций квадратичной сложности (пузырьковая сортировка) =", count)

    count = exponential(n)
    print("Число операций экспоненциальной сложности (итеративная реализация) =", count)
    count = exp_recur(n)
    print("Число операций экспоненциальной сложности (рекурсивная реализация) =", count)

    count = logarithmic(n)
    print("Число операций логарифмической сложности (итеративная реализация) =", count)
    count = log_recur(n)
    print("Число операций логарифмической сложности (рекурсивная реализация) =", count)

    count = linear_log_recur(n)
    print("Число операций линейно-логарифмической сложности (рекурсивная реализация) =", count)

    count = factorial_recur(n)
    print("Число операций факториальной сложности (рекурсивная реализация) =", count)
