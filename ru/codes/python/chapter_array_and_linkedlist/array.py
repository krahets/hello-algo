"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Случайный доступ к элементу"""
    # Случайный выбор числа из диапазона [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Получить и вернуть случайный элемент
    random_num = nums[random_index]
    return random_num


# Обратите внимание: list в Python — это динамический массив, его можно расширять напрямую
# Для удобства обучения в этой функции list рассматривается как массив неизменяемой длины
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Увеличение длины массива"""
    # Инициализировать массив увеличенной длины
    res = [0] * (len(nums) + enlarge)
    # Скопировать все элементы исходного массива в новый массив
    for i in range(len(nums)):
        res[i] = nums[i]
    # Вернуть новый массив после расширения
    return res


def insert(nums: list[int], num: int, index: int):
    """Вставка элемента num в массив по индексу index"""
    # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Присвоить num элементу по индексу index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Удаление элемента по индексу index"""
    # Сдвинуть все элементы после индекса index на одну позицию влево
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Обход массива"""
    count = 0
    # Обход массива по индексам
    for i in range(len(nums)):
        count += nums[i]
    # Непосредственно обходить элементы массива
    for num in nums:
        count += num
    # Одновременно обходить индексы и элементы данных
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Поиск заданного элемента в массиве"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация массива
    arr = [0] * 5
    print("Массив arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Массив nums =", nums)

    # Случайный доступ
    random_num: int = random_access(nums)
    print("Случайный элемент из nums =", random_num)

    # Расширение длины
    nums: list[int] = extend(nums, 3)
    print("После увеличения длины массива до 8 nums =", nums)

    # Вставка элемента
    insert(nums, 6, 3)
    print("После вставки числа 6 по индексу 3 nums =", nums)

    # Удаление элемента
    remove(nums, 2)
    print("После удаления элемента по индексу 2 nums =", nums)

    # Обход массива
    traverse(nums)

    # Поиск элемента
    index: int = find(nums, 3)
    print("Поиск элемента 3 в nums: индекс =", index)
