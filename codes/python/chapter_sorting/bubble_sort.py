"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]) -> None:
    """冒泡排序"""
    n: int = len(nums)
    # 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in range(n - 1, 0, -1):
        # 内循环：冒泡操作
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交换 nums[j] 与 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]) -> None:
    """冒泡排序（标志优化）"""
    n: int = len(nums)
    # 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in range(n - 1, 0, -1):
        flag: bool = False  # 初始化标志位
        # 内循环：冒泡操作
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交换 nums[j] 与 nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 记录交换元素
        if not flag:
            break  # 此轮冒泡未交换任何元素，直接跳出


"""Driver Code"""
if __name__ == "__main__":
    nums: list[int] = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("排序后数组 nums =", nums)

    nums1: list[int] = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("排序后数组 nums =", nums1)
