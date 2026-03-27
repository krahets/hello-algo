"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз"""
    while True:
        # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
        if ma == i:
            break
        # Поменять местами два узла
        nums[i], nums[ma] = nums[ma], nums[i]
        # Циклически выполнять просеивание вниз
        i = ma


def heap_sort(nums: list[int]):
    """Сортировка кучей"""
    # Построение кучи: выполнить просеивание для всех узлов, кроме листьев
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Извлекать максимальный элемент из кучи в течение n-1 итераций
    for i in range(len(nums) - 1, 0, -1):
        # Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        nums[0], nums[i] = nums[i], nums[0]
        # Начиная с корневого узла, выполнить просеивание сверху вниз
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("Сортировка кучейпосле завершения nums =", nums)
