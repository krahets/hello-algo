"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """Binary search for insertion point (no duplicate elements)"""
    i, j = 0, len(nums) - 1  # Initialize double closed interval [0, n-1]
    while i <= j:
        m = i + (j - i) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # Target is in interval [m+1, j]
        elif nums[m] > target:
            j = m - 1  # Target is in interval [i, m-1]
        else:
            return m  # Found target, return insertion point m
    # Did not find target, return insertion point i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """Binary search for insertion point (with duplicate elements)"""
    i, j = 0, len(nums) - 1  # Initialize double closed interval [0, n-1]
    while i <= j:
        m = i + (j - i) // 2  # Calculate midpoint index m
        if nums[m] < target:
            i = m + 1  # Target is in interval [m+1, j]
        elif nums[m] > target:
            j = m - 1  # Target is in interval [i, m-1]
        else:
            j = m - 1  # First element less than target is in interval [i, m-1]
    # Return insertion point i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # Array without duplicate elements
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\nArray nums = {nums}")
    # Binary search for insertion point
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"Element {target}'s insertion point index is {index}")

    # Array with duplicate elements
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")
    # Binary search for insertion point
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"Element {target}'s insertion point index is {index}")
