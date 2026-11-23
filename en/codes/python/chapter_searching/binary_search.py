"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """Binary search (closed interval)"""
    # Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    i, j = 0, len(nums) - 1
    # Loop until the search interval is empty (when i > j)
    while i <= j:
        # Python integers can grow arbitrarily large, subject to available memory, so integer overflow is not a concern
        m = (i + j) // 2  # Calculate the midpoint index m
        if nums[m] < target:
            i = m + 1  # In this case, target must be in [m+1, j] if it exists
        elif nums[m] > target:
            j = m - 1  # In this case, target must be in [i, m-1] if it exists
        else:
            return m  # The target element was found; return its index
    return -1  # The target element was not found; return -1


def binary_search_lcro(nums: list[int], target: int) -> int:
    """Binary search (left-closed, right-open interval)"""
    # Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    i, j = 0, len(nums)
    # Loop until the search interval is empty (when i = j)
    while i < j:
        m = (i + j) // 2  # Calculate the midpoint index m
        if nums[m] < target:
            i = m + 1  # In this case, target must be in [m+1, j) if it exists
        elif nums[m] > target:
            j = m  # In this case, target must be in [i, m) if it exists
        else:
            return m  # The target element was found; return its index
    return -1  # The target element was not found; return -1


"""Driver code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search (closed interval)
    index = binary_search(nums, target)
    print("Index of target element 6 = ", index)

    # Binary search (left-closed, right-open interval)
    index = binary_search_lcro(nums, target)
    print("Index of target element 6 = ", index)
