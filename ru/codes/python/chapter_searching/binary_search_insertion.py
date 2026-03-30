"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """Бинарный поиск точки вставки (без повторяющихся элементов)"""
    i, j = 0, len(nums) - 1  # Инициализировать двусторонне замкнутый интервал [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Вычислить индекс середины m
        if nums[m] < target:
            i = m + 1  # target находится в интервале [m+1, j]
        elif nums[m] > target:
            j = m - 1  # target находится в интервале [i, m-1]
        else:
            return m  # Найти target и вернуть точку вставки m
    # target не найден, вернуть точку вставки i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """Бинарный поиск точки вставки (с повторяющимися элементами)"""
    i, j = 0, len(nums) - 1  # Инициализировать двусторонне замкнутый интервал [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Вычислить индекс середины m
        if nums[m] < target:
            i = m + 1  # target находится в интервале [m+1, j]
        elif nums[m] > target:
            j = m - 1  # target находится в интервале [i, m-1]
        else:
            j = m - 1  # Первый элемент меньше target находится в интервале [i, m-1]
    # Вернуть точку вставки i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # Массив без повторяющихся элементов
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\nМассив nums = {nums}")
    # Бинарный поиск точки вставки
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"Индекс позиции вставки элемента {target} равен {index}")

    # Массив с повторяющимися элементами
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nМассив nums = {nums}")
    # Бинарный поиск точки вставки
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"Индекс позиции вставки элемента {target} равен {index}")
