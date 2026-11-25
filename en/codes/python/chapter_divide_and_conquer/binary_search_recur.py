"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """Binary search: problem f(i, j)"""
    # An empty interval contains no target, so return -1
    if i > j:
        return -1
    # Compute the middle index m
    m = (i + j) // 2
    if nums[m] < target:
        # Recursively solve f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # Recursively solve f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # Target found: return its index
        return m


def binary_search(nums: list[int], target: int) -> int:
    """Binary search"""
    n = len(nums)
    # Solve f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search (closed interval)
    index = binary_search(nums, target)
    print("Index of target 6 =  ", index)
