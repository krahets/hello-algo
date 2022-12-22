"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱 """
def random_numbers(n):
    # 生成数组 nums =: 1, 2, 3, ..., n 
    nums = [i for i in range(1, n + 1)]
    # 随机打乱数组元素
    random.shuffle(nums)
    return nums

""" 查找数组 nums 中数字 1 所在索引 """
def find_one(nums):
    for i in range(len(nums)):
        if nums[i] == 1:
            return i
    return -1


""" Driver Code """
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums = random_numbers(n)
        index = find_one(nums)
        print("\n数组 [ 1, 2, ..., n ] 被打乱后 =", nums)
        print("数字 1 的索引为", index)
