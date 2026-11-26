"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """建立含有 1, 2, ..., n 的陣列，並打亂順序"""
    # 建立陣列 nums = 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # 隨機打亂陣列元素
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """在陣列 nums 中尋找數字 1 的索引"""
    for i in range(len(nums)):
        # 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        # 若 1 在陣列末端，最差時間複雜度為 O(n)
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n陣列 [ 1, 2, ..., n ] 打亂順序後 =", nums)
        print("數字 1 的索引為", index)
