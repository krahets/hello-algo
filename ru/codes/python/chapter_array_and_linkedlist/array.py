"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Чтение случайного элемента"""
    # Выбрать случайное число из интервала [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Получить и вернуть случайный элемент
    random_num = nums[random_index]
    return random_num


# В Python list — динамический массив, который можно расширять напрямую
# В этом учебном примере функция рассматривает list как массив фиксированной длины
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Увеличение длины массива"""
    # Создать массив увеличенной длины
    res = [0] * (len(nums) + enlarge)
    # Скопировать все элементы исходного массива в новый
    for i in range(len(nums)):
        res[i] = nums[i]
    # Вернуть новый массив увеличенной длины
    return res


def insert(nums: list[int], num: int, index: int):
    """Вставить num в массив по индексу index"""
    # Сдвинуть на одну позицию вправо все элементы начиная с index
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Записать num по индексу index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Удалить элемент по индексу index"""
    # Сдвинуть все элементы после index на одну позицию влево
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Обход массива"""
    count = 0
    # Обойти массив по индексам
    for i in range(len(nums)):
        count += nums[i]
    # Перебрать элементы массива напрямую
    for num in nums:
        count += num
    # Одновременно перебирать индексы и элементы
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

    # Чтение случайного элемента
    random_num: int = random_access(nums)
    print("Случайный элемент nums:", random_num)

    # Увеличение длины
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
    print("Индекс элемента 3 в nums =", index)
