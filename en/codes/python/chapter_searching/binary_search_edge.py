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
    """Use binary search to find the leftmost occurrence of target"""
    # Equivalent to finding the insertion point for target
    i = binary_search_insertion(nums, target)
    # Target not found. Return -1
    if i == len(nums) or nums[i] != target:
        return -1
    # Found target. Return index i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """Use binary search to find the rightmost occurrence of target"""
    # Search for the leftmost occurrence of target + 1
    i = binary_search_insertion(nums, target + 1)
    # j points to the rightmost occurrence of target, and i to the first larger element
    j = i - 1
    # Target not found. Return -1
    if j == -1 or nums[j] != target:
        return -1
    # Found target. Return index j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # Array with duplicates
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")

    # Find the left and right boundaries using binary search
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"Index of the leftmost occurrence of {target} = {index}")
        index = binary_search_right_edge(nums, target)
        print(f"Index of the rightmost occurrence of {target} = {index}")
