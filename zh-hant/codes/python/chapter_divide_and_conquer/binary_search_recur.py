"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """二分搜尋：問題 f(i, j)"""
    # 若區間為空，代表無目標元素，則返回 -1
    if i > j:
        return -1
    # 計算中點索引 m
    m = (i + j) // 2
    if nums[m] < target:
        # 遞迴子問題 f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # 遞迴子問題 f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # 找到目標元素，返回其索引
        return m


def binary_search(nums: list[int], target: int) -> int:
    """二分搜尋"""
    n = len(nums)
    # 求解問題 f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分搜尋（雙閉區間）
    index = binary_search(nums, target)
    print("目標元素 6 的索引 = ", index)
