"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """二分搜尋插入點（無重複元素）"""
    i, j = 0, len(nums) - 1  # 初始化雙閉區間 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 計算中點索引 m
        if nums[m] < target:
            i = m + 1  # target 在區間 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在區間 [i, m-1] 中
        else:
            return m  # 找到 target ，返回插入點 m
    # 未找到 target ，返回插入點 i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """二分搜尋插入點（存在重複元素）"""
    i, j = 0, len(nums) - 1  # 初始化雙閉區間 [0, n-1]
    while i <= j:
        m = (i + j) // 2  # 計算中點索引 m
        if nums[m] < target:
            i = m + 1  # target 在區間 [m+1, j] 中
        elif nums[m] > target:
            j = m - 1  # target 在區間 [i, m-1] 中
        else:
            j = m - 1  # 首個小於 target 的元素在區間 [i, m-1] 中
    # 返回插入點 i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # 無重複元素的陣列
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\n陣列 nums = {nums}")
    # 二分搜尋插入點
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"元素 {target} 的插入點的索引為 {index}")

    # 包含重複元素的陣列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n陣列 nums = {nums}")
    # 二分搜尋插入點
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"元素 {target} 的插入點的索引為 {index}")
