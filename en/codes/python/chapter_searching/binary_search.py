"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """Binary search (closed interval)"""
    # Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    i, j = 0, len(nums) - 1
    # Loop, exit when the search interval is empty (empty when i > j)
    while i <= j:
        # In theory, Python numbers can be infinitely large (depending on memory size), no need to consider large number overflow
        m = (i + j) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # This means target is in the interval [m+1, j]
        elif nums[m] > target:
            j = m - 1  # This means target is in the interval [i, m-1]
        else:
            return m  # Found the target element, return its index
    return -1  # Target element not found, return -1


def binary_search_lcro(nums: list[int], target: int) -> int:
    """Binary search (left-closed right-open interval)"""
    # Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    i, j = 0, len(nums)
    # Loop, exit when the search interval is empty (empty when i = j)
    while i < j:
        m = (i + j) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # This means target is in the interval [m+1, j)
        elif nums[m] > target:
            j = m  # This means target is in the interval [i, m)
        else:
            return m  # Found the target element, return its index
    return -1  # Target element not found, return -1


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search (closed interval)
    index = binary_search(nums, target)
    print("Index of target element 6 =", index)

    # Binary search (left-closed right-open interval)
    index = binary_search_lcro(nums, target)
    print("Index of target element 6 =", index)
