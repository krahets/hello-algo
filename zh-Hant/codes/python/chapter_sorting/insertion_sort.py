"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """插入排序"""
    # 外迴圈：已排序區間為 [0, i-1]
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # 將 nums[j] 向右移動一位
            j -= 1
        nums[j + 1] = base  # 將 base 賦值到正確位置


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("插入排序完成後 nums =", nums)
