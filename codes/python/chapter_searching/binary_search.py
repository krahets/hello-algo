"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """二分查找（双闭区间）"""
    # 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    i, j = 0, len(nums) - 1
    while i <= j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:  # 此情况说明 target 在区间 [m+1, j] 中
            i = m + 1
        elif nums[m] > target:  # 此情况说明 target 在区间 [i, m-1] 中
            j = m - 1
        else:
            return m  # 找到目标元素，返回其索引
    return -1  # 未找到目标元素，返回 -1


def binary_search1(nums: list[int], target: int) -> int:
    """二分查找（左闭右开）"""
    # 初始化左闭右开 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
    i, j = 0, len(nums)
    # 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while i < j:
        m = (i + j) // 2  # 计算中点索引 m
        if nums[m] < target:  # 此情况说明 target 在区间 [m+1, j) 中
            i = m + 1
        elif nums[m] > target:  # 此情况说明 target 在区间 [i, m) 中
            j = m
        else:  # 找到目标元素，返回其索引
            return m
    return -1  # 未找到目标元素，返回 -1


"""Driver Code"""
if __name__ == "__main__":
    target: int = 6
    nums: list[int] = [1, 3, 6, 8, 12, 15, 23, 67, 70, 92]

    # 二分查找（双闭区间）
    index: int = binary_search(nums, target)
    print("目标元素 6 的索引 = ", index)

    # 二分查找（左闭右开）
    index: int = binary_search1(nums, target)
    print("目标元素 6 的索引 = ", index)
