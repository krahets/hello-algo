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
    """最も左の target を二分探索"""
    # target の挿入位置を探すのと等価
    i = binary_search_insertion(nums, target)
    # target が見つからなければ、-1 を返す
    if i == len(nums) or nums[i] != target:
        return -1
    # target が見つかったら、インデックス i を返す
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """最も右の target を二分探索"""
    # 最左の target + 1 を探す問題に変換する
    i = binary_search_insertion(nums, target + 1)
    # j は最も右の target を指し、i は target より大きい最初の要素を指す
    j = i - 1
    # target が見つからなければ、-1 を返す
    if j == -1 or nums[j] != target:
        return -1
    # target が見つかったら、インデックス j を返す
    return j


"""Driver Code"""
if __name__ == "__main__":
    # 重複要素を含む配列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n配列 nums = {nums}")

    # 二分探索で左端と右端を探す
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"左端の要素 {target} のインデックスは {index}")
        index = binary_search_right_edge(nums, target)
        print(f"右端の要素 {target} のインデックスは {index}")
