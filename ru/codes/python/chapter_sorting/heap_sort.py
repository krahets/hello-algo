"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """Размер кучи равен n. Выполнить просеивание вниз от узла i"""
    while True:
        # Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if ma == i:
            break
        # Поменять два узла местами
        nums[i], nums[ma] = nums[ma], nums[i]
        # Продолжить просеивание вниз
        i = ma


def heap_sort(nums: list[int]):
    """Пирамидальная сортировка"""
    # Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # Извлечь максимум из кучи n-1 раз
    for i in range(len(nums) - 1, 0, -1):
        # Обменять корень с крайним правым листом (первый элемент с последним)
        nums[0], nums[i] = nums[i], nums[0]
        # Выполнить просеивание вниз от корня
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("После пирамидальной сортировки nums =", nums)
