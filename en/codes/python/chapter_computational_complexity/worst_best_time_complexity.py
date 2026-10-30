"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """Generate an array containing 1, 2, ..., n in shuffled order"""
    # Generate the array nums = 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # Randomly shuffle the array elements
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """Find the index of the number 1 in array nums"""
    for i in range(len(nums)):
        # When 1 is at the start of the array, the best-case time complexity is O(1)
        # When 1 is at the end of the array, the worst-case time complexity is O(n)
        if nums[i] == 1:
            return i
    return -1


"""Driver code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nArray [ 1, 2, ..., n ] after shuffling =", nums)
        print("The index of the number 1 is", index)
