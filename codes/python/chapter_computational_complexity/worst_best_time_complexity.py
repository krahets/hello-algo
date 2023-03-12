"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

def random_numbers(n: int) -> List[int]:
    """ 生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱 """
    # 生成数组 nums =: 1, 2, 3, ..., n
    nums: List[int] = [i for i in range(1, n + 1)]
    # 随机打乱数组元素
    random.shuffle(nums)
    return nums

def find_one(nums: List[int]) -> int:
    """ 查找数组 nums 中数字 1 所在索引 """
    for i in range(len(nums)):
        # 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        # 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if nums[i] == 1:
            return i
    return -1


""" Driver Code """
if __name__ == "__main__":
    for i in range(10):
        n: int = 100
        nums: List[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n数组 [ 1, 2, ..., n ] 被打乱后 =", nums)
        print("数字 1 的索引为", index)
