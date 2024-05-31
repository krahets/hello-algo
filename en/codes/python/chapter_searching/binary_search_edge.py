"""
File: binary_search_edge.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from binary_search_insertion import binary_search_insertion


def binary_search_left_edge(nums: list[int], target: int) -> int:
    """Binary search for the leftmost target"""
    # Equivalent to finding the insertion point of target
    i = binary_search_insertion(nums, target)
    # Did not find target, thus return -1
    if i == len(nums) or nums[i] != target:
        return -1
    # Found target, return index i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """Binary search for the rightmost target"""
    # Convert to finding the leftmost target + 1
    i = binary_search_insertion(nums, target + 1)
    # j points to the rightmost target, i points to the first element greater than target
    j = i - 1
    # Did not find target, thus return -1
    if j == -1 or nums[j] != target:
        return -1
    # Found target, return index j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # Array with duplicate elements
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")

    # Binary search for left and right boundaries
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"The index of the leftmost element {target} is {index}")
        index = binary_search_right_edge(nums, target)
        print(f"The index of the rightmost element {target} is {index}")
