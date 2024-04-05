"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """生成一個陣列，元素為: 1, 2, ..., n ，順序被打亂"""
    # 生成陣列 nums =: 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # 隨機打亂陣列元素
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """查詢陣列 nums 中數字 1 所在索引"""
    for i in range(len(nums)):
        # 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        # 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n陣列 [ 1, 2, ..., n ] 被打亂後 =", nums)
        print("數字 1 的索引為", index)
