"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """Binary search: problem f(i, j)"""
    # If the interval is empty, it means there is no target element, return -1
    if i > j:
        return -1
    # Calculate the midpoint index m
    m = (i + j) // 2
    if nums[m] < target:
        # Recursion subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # Recursion subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # Found the target element, return its index
        return m


def binary_search(nums: list[int], target: int) -> int:
    """Binary search"""
    n = len(nums)
    # Solve the problem f(0, n-1)
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search (closed interval on both sides)
    index = binary_search(nums, target)
    print("Index of target element 6 = ", index)
