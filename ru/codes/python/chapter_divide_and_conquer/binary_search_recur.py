"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """Бинарный поиск: задача f(i, j)"""
    # Если интервал пуст, целевой элемент отсутствует, вернуть -1
    if i > j:
        return -1
    # Вычислить индекс середины m
    m = (i + j) // 2
    if nums[m] < target:
        # Рекурсивная подзадача f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # Рекурсивная подзадача f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # Целевой элемент найден, вернуть его индекс
        return m


def binary_search(nums: list[int], target: int) -> int:
    """Бинарный поиск"""
    n = len(nums)
    # Решить задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Бинарный поиск (двусторонне замкнутый интервал)
    index = binary_search(nums, target)
    print("Индекс целевого элемента 6 = ", index)
