"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """Generate an array with elements: 1, 2, ..., n, shuffled in order"""
    # Generate array nums =: 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # Randomly shuffle array elements
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """Find the index of number 1 in array nums"""
    for i in range(len(nums)):
        # When element 1 is at the head of the array, best time complexity O(1) is achieved
        # When element 1 is at the tail of the array, worst time complexity O(n) is achieved
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nArray [ 1, 2, ..., n ] after being shuffled =", nums)
        print("The index of number 1 is", index)
