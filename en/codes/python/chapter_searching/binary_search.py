"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """Binary search (double closed interval)"""
    # Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    i, j = 0, len(nums) - 1
    # Loop until the search interval is empty (when i > j, it is empty)
    while i <= j:
        # Theoretically, Python's numbers can be infinitely large (depending on memory size), so there is no need to consider large number overflow
        m = i + (j - i) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # This situation indicates that target is in the interval [m+1, j]
        elif nums[m] > target:
            j = m - 1  # This situation indicates that target is in the interval [i, m-1]
        else:
            return m  # Found the target element, thus return its index
    return -1  # Did not find the target element, thus return -1


def binary_search_lcro(nums: list[int], target: int) -> int:
    """Binary search (left closed right open interval)"""
    # Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    i, j = 0, len(nums)
    # Loop until the search interval is empty (when i = j, it is empty)
    while i < j:
        m = i + (j - i) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # This situation indicates that target is in the interval [m+1, j)
        elif nums[m] > target:
            j = m  # This situation indicates that target is in the interval [i, m)
        else:
            return m  # Found the target element, thus return its index
    return -1  # Did not find the target element, thus return -1


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Binary search (double closed interval)
    index = binary_search(nums, target)
    print("Index of target element 6 =", index)

    # Binary search (left closed right open interval)
    index = binary_search_lcro(nums, target)
    print("Index of target element 6 =", index)
