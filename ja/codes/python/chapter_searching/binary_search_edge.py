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
    """最左端のターゲットの二分探索"""
    # ターゲットの挿入位置を見つけることと同等
    i = binary_search_insertion(nums, target)
    # ターゲットが見つからなかった場合、-1 を返す
    if i == len(nums) or nums[i] != target:
        return -1
    # ターゲットが見つかった場合、インデックス i を返す
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """最右端のターゲットの二分探索"""
    # 最左端のターゲット + 1 を見つけることに変換
    i = binary_search_insertion(nums, target + 1)
    # j は最右端のターゲットを指し、i はターゲットより大きい最初の要素を指す
    j = i - 1
    # ターゲットが見つからなかった場合、-1 を返す
    if j == -1 or nums[j] != target:
        return -1
    # ターゲットが見つかった場合、インデックス j を返す
    return j


"""ドライバーコード"""
if __name__ == "__main__":
    # 重複要素のある配列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n配列 nums = {nums}")

    # 左端と右端の境界の二分探索
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"最左端の要素 {target} のインデックスは {index}")
        index = binary_search_right_edge(nums, target)
        print(f"最右端の要素 {target} のインデックスは {index}")