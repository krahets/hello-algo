"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """1, 2, ..., n をランダムに並べた配列を生成"""
    # 1, 2, 3, ..., n を順に格納した配列 nums を生成
    nums = [i for i in range(1, n + 1)]
    # 配列の要素をシャッフル
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """配列 nums で数値 1 のインデックスを探す"""
    for i in range(len(nums)):
        # 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        # 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n配列 [ 1, 2, ..., n ] のシャッフル結果 =", nums)
        print("数値 1 のインデックスは", index)
