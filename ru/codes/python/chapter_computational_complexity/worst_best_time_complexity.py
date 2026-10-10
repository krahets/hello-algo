"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """Сгенерировать массив с элементами 1, 2, ..., n в случайном порядке"""
    # Создать массив nums =: 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # Случайно перемешать элементы массива
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """Найти индекс числа 1 в массиве nums"""
    for i in range(len(nums)):
        # Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        # Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nМассив [1, 2, ..., n] после перемешивания =", nums)
        print("Индекс числа 1 =", index)
