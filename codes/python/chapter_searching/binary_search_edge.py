"""
File: binary_search_edge.py
Created Time: 2023-08-04
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from binary_search_insertion import binary_search_insertion


def binary_search_left_edge(nums: list[int], target: int) -> int:
    """二分查找最左一个 target"""
    # 等价于查找 target 的插入点
    i = binary_search_insertion(nums, target)
    # 未找到 target ，返回 -1
    if i == len(nums) or nums[i] != target:
        return -1
    # 找到 target ，返回索引 i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """二分查找最右一个 target"""
    # 转化为查找最左一个 target + 1
    i = binary_search_insertion(nums, target + 1)
    # j 指向最右一个 target ，i 指向首个大于 target 的元素
    j = i - 1
    # 未找到 target ，返回 -1
    if j == -1 or nums[j] != target:
        return -1
    # 找到 target ，返回索引 j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # 包含重复元素的数组
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n数组 nums = {nums}")

    # 二分查找左边界和右边界
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"最左一个元素 {target} 的索引为 {index}")
        index = binary_search_right_edge(nums, target)
        print(f"最右一个元素 {target} 的索引为 {index}")
