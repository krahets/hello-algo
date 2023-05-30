"""
File: binary_search_edge.py
Created Time: 2023-05-18
Author: Krahets (krahets@163.com)
"""


def binary_search_left_edge(nums: list[int], target: int) -> int:
    """二分查找最左一个元素"""
    i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:
            i = m + 1  # target 在区间 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在区间 [i, m-1] 中
        else:
            j = m - 1  # 首个小于 target 的元素在区间 [i, m-1] 中
    if i == len(nums) or nums[i] != target:
        return -1  # 未找到目标元素，返回 -1
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """二分查找最右一个元素"""
    i, j = 0, len(nums) - 1  # 初始化双闭区间 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:
            i = m + 1  # target 在区间 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在区间 [i, m-1] 中
        else:
            i = m + 1  # 首个大于 target 的元素在区间 [m+1, j] 中
    if j == len(nums) or nums[j] != target:
        return -1  # 未找到目标元素，返回 -1
    return j


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]

    # 二分查找最左一个元素
    index_left = binary_search_left_edge(nums, target)
    print("数组中最左一个元素 6 的索引 = ", index_left)

    # 二分查找最右一个元素
    index_right = binary_search_right_edge(nums, target)
    print("数组中最右一个元素 6 的索引 = ", index_right)
