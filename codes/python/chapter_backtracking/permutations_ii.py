"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """回溯算法：全排列 II"""
    # 当状态长度等于元素数量时，记录解
    if len(state) == len(choices):
        res.append(list(state))
        return
    # 遍历所有选择
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        if not selected[i] and choice not in duplicated:
            # 尝试：做出选择，更新状态
            duplicated.add(choice)  # 记录选择过的元素值
            selected[i] = True
            state.append(choice)
            # 进行下一轮选择
            backtrack(state, choices, selected, res)
            # 回退：撤销选择，恢复到之前的状态
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """全排列 II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"输入数组 nums = {nums}")
    print(f"所有排列 res = {res}")
