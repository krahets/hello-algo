"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """Find an insertion point using binary search (no duplicates)"""
    i, j = 0, len(nums) - 1  # Initialize the closed interval [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Calculate the midpoint index m
        if nums[m] < target:
            i = m + 1  # Target must be in [m+1, j] if it exists
        elif nums[m] > target:
            j = m - 1  # Target must be in [i, m-1] if it exists
        else:
            return m  # Target was found; return insertion point m
    # Target was not found; return insertion point i
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """Find an insertion point using binary search (with duplicates)"""
    i, j = 0, len(nums) - 1  # Initialize the closed interval [0, n-1]
    while i <= j:
        m = (i + j) // 2  # Calculate the midpoint index m
        if nums[m] < target:
            i = m + 1  # Target must be in [m+1, j] if it exists
        elif nums[m] > target:
            j = m - 1  # Target must be in [i, m-1] if it exists
        else:
            j = m - 1  # Continue in [i, m-1] to find the rightmost element smaller than target
    # Return insertion point i
    return i


"""Driver code"""
if __name__ == "__main__":
    # Array with no duplicate elements
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\nArray nums = {nums}")
    # Find an insertion point using binary search
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"Insertion index for element {target}: {index}")

    # Array containing duplicate elements
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")
    # Find an insertion point using binary search
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"Insertion index for element {target}: {index}")
