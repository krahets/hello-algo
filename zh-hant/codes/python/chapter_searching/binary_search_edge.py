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
    """用二分搜尋找最左邊的 target"""
    # 等同於搜尋 target 的插入點
    i = binary_search_insertion(nums, target)
    # 找不到 target，回傳 -1
    if i == len(nums) or nums[i] != target:
        return -1
    # 找到 target，回傳索引 i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """用二分搜尋找最右邊的 target"""
    # 改為搜尋 target + 1 的最左插入位置
    i = binary_search_insertion(nums, target + 1)
    # j 指向最右邊的 target，i 指向第一個大於 target 的元素
    j = i - 1
    # 找不到 target，回傳 -1
    if j == -1 or nums[j] != target:
        return -1
    # 找到 target，回傳索引 j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # 含有重複元素的陣列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n陣列 nums = {nums}")

    # 用二分搜尋找左界和右界
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"最左邊的元素 {target} 的索引為 {index}")
        index = binary_search_right_edge(nums, target)
        print(f"最右邊的元素 {target} 的索引為 {index}")
