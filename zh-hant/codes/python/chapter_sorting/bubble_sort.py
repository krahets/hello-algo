"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """泡沫排序"""
    n = len(nums)
    # 外迴圈：未排序區間為 [0, i]
    for i in range(n - 1, 0, -1):
        # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """泡沫排序（標誌最佳化）"""
    n = len(nums)
    # 外迴圈：未排序區間為 [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # 初始化標誌位
        # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 記錄交換元素
        if not flag:
            break  # 此輪“冒泡”未交換任何元素，直接跳出


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("泡沫排序完成後 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("泡沫排序完成後 nums =", nums1)
