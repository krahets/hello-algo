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
    """最も左にある target の二分探索"""
    # target の挿入位置を探すことと同じ
    i = binary_search_insertion(nums, target)
    # target が見つからなかったので -1 を返す
    if i == len(nums) or nums[i] != target:
        return -1
    # target が見つかったのでインデックス i を返す
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """最も右にある target の二分探索"""
    # 最も左にある target + 1 の探索に置き換える
    i = binary_search_insertion(nums, target + 1)
    # j は最も右の target を、i は target より大きい最初の要素を指す
    j = i - 1
    # target が見つからなかったので -1 を返す
    if j == -1 or nums[j] != target:
        return -1
    # target が見つかったのでインデックス j を返す
    return j


"""Driver Code"""
if __name__ == "__main__":
    # 重複する要素がある配列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n配列 nums = {nums}")

    # 左端と右端の二分探索
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"最も左にある {target} のインデックスは {index}")
        index = binary_search_right_edge(nums, target)
        print(f"最も右にある {target} のインデックスは {index}")
