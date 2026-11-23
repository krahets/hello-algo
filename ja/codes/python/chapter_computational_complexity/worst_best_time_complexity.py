"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """要素が 1, 2, ..., n で、順序をシャッフルした配列を生成する"""
    # 配列 nums =: 1, 2, 3, ..., n を生成する
    nums = [i for i in range(1, n + 1)]
    # 配列の要素をランダムに並べ替える
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """配列 nums 内で数値 1 のインデックスを探索する"""
    for i in range(len(nums)):
        # 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
        # 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
        if nums[i] == 1:
            return i
    return -1


"""実行用コード"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n配列 [ 1, 2, ..., n ] をシャッフルした結果 =", nums)
        print("数値 1 のインデックスは", index)
