"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """Сортировка выбором"""
    n = len(nums)
    # Внешний цикл: неотсортированный диапазон [i, n-1]
    for i in range(n - 1):
        # Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # Записать индекс минимального элемента
        # Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("После сортировки выбором nums =", nums)
