"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """Создать массив из чисел { 1, 2, ..., n } в случайном порядке"""
    # Создать массив nums = { 1, 2, 3, ..., n }
    nums = [i for i in range(1, n + 1)]
    # Случайно перемешать элементы массива
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """Найти индекс числа 1 в массиве nums"""
    for i in range(len(nums)):
        # Если 1 стоит в начале массива, сложность минимальна: O(1)
        # Если 1 стоит в конце массива, сложность максимальна: O(n)
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nМассив [ 1, 2, ..., n ] после перемешивания =", nums)
        print("Индекс числа 1:", index)
