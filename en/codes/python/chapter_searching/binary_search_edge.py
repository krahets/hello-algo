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
    """Find the leftmost occurrence of target using binary search"""
    # This is equivalent to finding the insertion point of target
    i = binary_search_insertion(nums, target)
    # If target was not found, return -1
    if i == len(nums) or nums[i] != target:
        return -1
    # Target was found; return index i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """Find the rightmost occurrence of target using binary search"""
    # Reduce the problem to finding the leftmost insertion point of target + 1
    i = binary_search_insertion(nums, target + 1)
    # j is the candidate rightmost target index; i is the index of the first element greater than target, or len(nums)
    j = i - 1
    # If target was not found, return -1
    if j == -1 or nums[j] != target:
        return -1
    # Target was found; return index j
    return j


"""Driver code"""
if __name__ == "__main__":
    # Array containing duplicate elements
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\nArray nums = {nums}")

    # Find the left and right boundaries using binary search
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"Index of the leftmost occurrence of {target}: {index}")
        index = binary_search_right_edge(nums, target)
        print(f"Index of the rightmost occurrence of {target}: {index}")
