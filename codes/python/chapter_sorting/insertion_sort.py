"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]) -> None:
    """插入排序"""
    # 外循环：base = nums[1], nums[2], ..., nums[n-1]
    for i in range(1, len(nums)):
        base: int = nums[i]
        j: int = i - 1
        # 内循环：将 base 插入到左边的正确位置
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # 1. 将 nums[j] 向右移动一位
            j -= 1
        nums[j + 1] = base  # 2. 将 base 赋值到正确位置


"""Driver Code"""
if __name__ == "__main__":
    nums: list[int] = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("排序后数组 nums =", nums)
