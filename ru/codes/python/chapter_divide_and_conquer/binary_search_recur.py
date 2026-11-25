"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """Двоичный поиск: задача f(i, j)"""
    # Если интервал пуст, искомого элемента нет. Возвращаем -1
    if i > j:
        return -1
    # Вычисляем индекс середины m
    m = (i + j) // 2
    if nums[m] < target:
        # Рекурсивно решаем подзадачу f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # Рекурсивно решаем подзадачу f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # Искомый элемент найден. Возвращаем его индекс
        return m


def binary_search(nums: list[int], target: int) -> int:
    """Двоичный поиск"""
    n = len(nums)
    # Решаем задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Двоичный поиск (замкнутый интервал)
    index = binary_search(nums, target)
    print("Индекс элемента 6 = ", index)
