"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """Сортировка вставками"""
    # Внешний цикл: отсортированный диапазон [0, i-1]
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # Сдвинуть nums[j] на одну позицию вправо
            j -= 1
        nums[j + 1] = base  # Поместить base в правильную позицию


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("После сортировки вставками nums =", nums)
