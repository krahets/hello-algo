"""
File: binary_search_edge.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
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
def binary_search_edge(nums: list[int], target: int) -> int:
    """二分查找target左右边界"""
    # 当数组中不包含target时,索引i,j最终分别指向首个大于,小于target的元素
    # 左侧边界查找 = 查找target-0.5 ;返回索引i
    # 右侧边界查找 = 查找target+0.5 ;返回索引j
    i = binary_search_insertion(nums, target - 0.5)
    j = binary_search_insertion(nums, target + 0.5) - 1
    # 当数组中存在元素target时,左侧边界<=右侧边界
    if i > j:
        return -1, -1
    else:
    	return i, j

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
    # 二分查找左右边界
    for target1 in [6,8,10]:
        left_index,right_index = binary_search_edge(nums, target1)
        print(f"元素 {target1} 的左右边界索引分别为 {left_index}, {right_index}")