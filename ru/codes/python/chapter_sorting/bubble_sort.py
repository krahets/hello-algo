"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """Пузырьковая сортировка"""
    n = len(nums)
    # Внешний цикл: неотсортированный диапазон равен [0, i]
    for i in range(n - 1, 0, -1):
        # Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Поменять местами nums[j] и nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """Пузырьковая сортировка (оптимизация флагом)"""
    n = len(nums)
    # Внешний цикл: неотсортированный диапазон равен [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # Инициализировать флаг
        # Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Поменять местами nums[j] и nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # Записать элементы для обмена
        if not flag:
            break  # В этом проходе пузырьковой сортировки не было ни одного обмена, поэтому можно сразу выйти


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("После завершения пузырьковой сортировки nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("После завершения пузырьковой сортировки nums =", nums1)
