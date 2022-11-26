'''
File: leetcode_two_sum.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

class SolutionBruteForce:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return i, j
        return []

class SolutionHashMap:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dic = {}
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return dic[target - nums[i]], i
            dic[nums[i]] = i
        return []


""" Driver Code """
if __name__ == '__main__':
    # ======= Test Case =======
    nums = [ 2,7,11,15 ];
    target = 9;
    
    # ====== Driver Code ======
    # 方法一
    res = SolutionBruteForce().twoSum(nums, target);
    print("方法一 res =", res)
    # 方法二
    res = SolutionHashMap().twoSum(nums, target);
    print("方法二 res =", res)
