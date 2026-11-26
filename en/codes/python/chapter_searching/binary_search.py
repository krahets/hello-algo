"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """Binary search on a closed interval"""
    # Initialize the closed interval [0, n-1] with i at the first element and j at the last
    i, j = 0, len(nums) - 1
    # Stop when the search interval is empty (i > j)
    while i <= j:
        # Python integers can grow as large as memory allows, so overflow is not a concern here
        m = (i + j) // 2  # Compute the midpoint index m
        if nums[m] < target:
            i = m + 1  # Any match must lie in [m+1, j]
        elif nums[m] > target:
            j = m - 1  # Any match must lie in [i, m-1]
        else:
            return m  # Found the target. Return its index
    return -1  # Target not found. Return -1


def binary_search_lcro(nums: list[int], target: int) -> int:
    """Binary search on a left-closed, right-open interval"""
    # Initialize [0, n) with i at the first element and j one past the last
    i, j = 0, len(nums)
    # Stop when the search interval is empty (i = j)
    while i < j:
        m = (i + j) // 2  # Compute the midpoint index m
        if nums[m] < target:
            i = m + 1  # Any match must lie in [m+1, j)
        elif nums[m] > target:
            j = m  # Any match must lie in [i, m)
        else:
            return m  # Found the target. Return its index
    return -1  # Target not found. Return -1


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search on a closed interval
    index = binary_search(nums, target)
    print("Index of target 6 = ", index)

    # Binary search on a left-closed, right-open interval
    index = binary_search_lcro(nums, target)
    print("Index of target 6 = ", index)
