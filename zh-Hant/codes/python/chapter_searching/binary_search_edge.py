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
    """二分搜尋最左一個 target"""
    # 等價於查詢 target 的插入點
    i = binary_search_insertion(nums, target)
    # 未找到 target ，返回 -1
    if i == len(nums) or nums[i] != target:
        return -1
    # 找到 target ，返回索引 i
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """二分搜尋最右一個 target"""
    # 轉化為查詢最左一個 target + 1
    i = binary_search_insertion(nums, target + 1)
    # j 指向最右一個 target ，i 指向首個大於 target 的元素
    j = i - 1
    # 未找到 target ，返回 -1
    if j == -1 or nums[j] != target:
        return -1
    # 找到 target ，返回索引 j
    return j


"""Driver Code"""
if __name__ == "__main__":
    # 包含重複元素的陣列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n陣列 nums = {nums}")

    # 二分搜尋左邊界和右邊界
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"最左一個元素 {target} 的索引為 {index}")
        index = binary_search_right_edge(nums, target)
        print(f"最右一個元素 {target} 的索引為 {index}")
