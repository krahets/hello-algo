"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз"""
    while True:
        # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
        if ma == i:
            break
        # Поменять два узла местами
        nums[i], nums[ma] = nums[ma], nums[i]
        # Циклическое просеивание вниз
        i = ma


def heap_sort(nums: list[int]):
    """Сортировка кучей"""
    # Построение кучи: выполнить heapify для всех узлов, кроме листовых
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Извлекать максимальный элемент из кучи в течение n-1 итераций
    for i in range(len(nums) - 1, 0, -1):
        # Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        nums[0], nums[i] = nums[i], nums[0]
        # Начиная с корневого узла, выполнить просеивание сверху вниз
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("После сортировки кучей nums =", nums)
