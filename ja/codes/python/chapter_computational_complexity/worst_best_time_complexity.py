"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """要素 1, 2, ..., n を含む配列を生成、順序はシャッフル"""
    # 配列 nums = 1, 2, 3, ..., n を生成
    nums = [i for i in range(1, n + 1)]
    # 配列要素をランダムにシャッフル
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """配列 nums で数値 1 のインデックスを検索"""
    for i in range(len(nums)):
        # 要素 1 が配列の最初にある場合、最良時間計算量 O(1) を達成
        # 要素 1 が配列の最後にある場合、最悪時間計算量 O(n) を達成
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\nシャッフル後の配列 [ 1, 2, ..., n ] =", nums)
        print("数値 1 のインデックス =", index)