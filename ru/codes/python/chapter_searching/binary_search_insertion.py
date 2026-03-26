"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """Бинарный поиск точки вставки (без повторяющихся элементов)"""
    i, j = 0, len(nums) - 1  # Инициализировать закрытый интервал [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Вычислить средний индекс m
        if nums[m] < target:
            i = m + 1  # target находится в интервале [m+1, j]
        elif nums[m] > target:
            j = m - 1  # target находится в интервале [i, m-1]
        else:
            return m  # Найти target и вернуть точку вставки m
    # Если target не найден, вернуть точку вставки i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """Бинарный поиск точки вставки (при наличии повторяющихся элементов)"""
    i, j = 0, len(nums) - 1  # Инициализировать закрытый интервал [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Вычислить средний индекс m
        if nums[m] < target:
            i = m + 1  # target находится в интервале [m+1, j]
        elif nums[m] > target:
            j = m - 1  # target находится в интервале [i, m-1]
        else:
            j = m - 1  # Первый элемент, меньший target, находится в интервале [i, m-1]
    # Вернуть точку вставки i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # Массив без повторяющихся элементов
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\nМассив nums = {nums}")
    # Найти точку вставки бинарным поиском
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"Индекс точки вставки элемента {target} равен {index}")

    # Массив с повторяющимися элементами
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nМассив nums = {nums}")
    # Найти точку вставки бинарным поиском
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"Индекс точки вставки элемента {target} равен {index}")
