"""
File: binary_search_edge.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from binary_search_insertion import binary_search_insertion


def binary_search_left_edge(nums: list[int], target: int) -> int:
    """Бинарный поиск самого левого target"""
    # Эквивалентно поиску точки вставки target
    i = binary_search_insertion(nums, target)
    # target не найден, вернуть -1
    if i == len(nums) or nums[i] != target:
        return -1
    # Найти target и вернуть индекс i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """Бинарный поиск самого правого target"""
    # Преобразовать задачу в поиск самого левого target + 1
    i = binary_search_insertion(nums, target + 1)
    # j указывает на самый правый target, а i — на первый элемент больше target
    j = i - 1
    # target не найден, вернуть -1
    if j == -1 or nums[j] != target:
        return -1
    # Найти target и вернуть индекс j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # Массив с повторяющимися элементами
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nМассив nums = {nums}")

    # Бинарный поиск левой и правой границы
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"Индекс самого левого элемента {target} равен {index}")
        index = binary_search_right_edge(nums, target)
        print(f"Индекс самого правого элемента {target} равен {index}")
