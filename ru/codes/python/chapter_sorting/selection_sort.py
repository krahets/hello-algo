"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """Сортировка выбором"""
    n = len(nums)
    # Внешний цикл: неотсортированный участок [i, n-1]
    for i in range(n - 1):
        # Внутренний цикл: найти минимум неотсортированного участка
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # Запомнить индекс минимума
        # Поменять минимум местами с первым элементом неотсортированного участка
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("После сортировки выбором nums =", nums)
