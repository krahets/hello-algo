"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """Binary search for an insertion point (no duplicates)"""
    i, j = 0, len(nums) - 1  # Initialize the closed interval [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Compute the midpoint index m
        if nums[m] < target:
            i = m + 1  # Any match must lie in [m+1, j]
        elif nums[m] > target:
            j = m - 1  # Any match must lie in [i, m-1]
        else:
            return m  # Found target. Return insertion point m
    # Target not found. Return insertion point i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """Binary search for an insertion point (duplicates allowed)"""
    i, j = 0, len(nums) - 1  # Initialize the closed interval [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Compute the midpoint index m
        if nums[m] < target:
            i = m + 1  # Any match must lie in [m+1, j]
        elif nums[m] > target:
            j = m - 1  # Any match must lie in [i, m-1]
        else:
            j = m - 1  # Look in [i, m-1] for the rightmost element less than target
    # Return insertion point i
    return i


"""Driver Code"""
if __name__ == "__main__":
    # Array without duplicates
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\nArray nums = {nums}")
    # Find the insertion point using binary search
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"Insertion index for {target} = {index}")

    # Array with duplicates
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")
    # Find the insertion point using binary search
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"Insertion index for {target} = {index}")
