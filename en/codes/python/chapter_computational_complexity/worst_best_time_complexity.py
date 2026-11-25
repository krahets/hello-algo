"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """Generate a shuffled array containing 1, 2, ..., n"""
    # Generate nums with elements 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # Shuffle the array elements at random
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """Find the index of 1 in the array nums"""
    for i in range(len(nums)):
        # Best case: 1 is the first element, so the search takes O(1) time
        # Worst case: 1 is the last element, so the search takes O(n) time
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nShuffled array [ 1, 2, ..., n ] =", nums)
        print("Index of 1 =", index)
