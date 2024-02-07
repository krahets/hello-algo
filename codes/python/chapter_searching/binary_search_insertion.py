"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """二分查找插入点（无重复元素）"""
    i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:
            i = m + 1  # target 在区间 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在区间 [i, m-1] 中
        else:
            return m  # 找到 target ，返回插入点 m
    # 未找到 target ，返回插入点 i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """二分查找插入点（存在重复元素）"""
    i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:
            i = m + 1  # target 在区间 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在区间 [i, m-1] 中
        else:
            j = m - 1  # 首个小于 target 的元素在区间 [i, m-1] 中
    # 返回插入点 i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # 无重复元素的数组
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\n数组 nums = {nums}")
    # 二分查找插入点
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"元素 {target} 的插入点的索引为 {index}")

    # 包含重复元素的数组
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n数组 nums = {nums}")
    # 二分查找插入点
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"元素 {target} 的插入点的索引为 {index}")
