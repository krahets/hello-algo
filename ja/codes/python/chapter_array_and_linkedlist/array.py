"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """要素へランダムアクセス"""
    # 区間 [0, len(nums)-1] からランダムに数字を 1 つ選ぶ
    random_index = random.randint(0, len(nums) - 1)
    # ランダムな要素を取得して返す
    random_num = nums[random_index]
    return random_num


# Python の list は動的配列であり、直接拡張できます
# 学習しやすいよう、本関数では list を長さ不変の配列として扱います
def extend(nums: list[int], enlarge: int) -> list[int]:
    """配列長を拡張する"""
    # 拡張後の長さを持つ配列を初期化する
    res = [0] * (len(nums) + enlarge)
    # 元の配列の全要素を新しい配列にコピー
    for i in range(len(nums)):
        res[i] = nums[i]
    # 拡張後の新しい配列を返す
    return res


def insert(nums: list[int], num: int, index: int):
    """配列の index 番目に要素 num を挿入"""
    # インデックス index 以降の全要素を 1 つ後ろへ移動する
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # index の要素に num を代入する
    nums[index] = num


def remove(nums: list[int], index: int):
    """index の要素を削除する"""
    # インデックス index より後ろの全要素を 1 つ前へ移動する
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """配列を走査"""
    count = 0
    # インデックスで配列を走査
    for i in range(len(nums)):
        count += nums[i]
    # 配列要素を直接走査
    for num in nums:
        count += num
    # データのインデックスと要素を同時に走査する
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """配列内で指定要素を探す"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # 配列を初期化
    arr = [0] * 5
    print("配列 arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("配列 nums =", nums)

    # ランダムアクセス
    random_num: int = random_access(nums)
    print("nums からランダムな要素を取得", random_num)

    # 長さを拡張
    nums: list[int] = extend(nums, 3)
    print("配列の長さを 8 に拡張し、nums =", nums)

    # 要素を挿入する
    insert(nums, 6, 3)
    print("インデックス 3 に数値 6 を挿入し、nums =", nums)

    # 要素を削除
    remove(nums, 2)
    print("インデックス 2 の要素を削除し、nums =", nums)

    # 配列を走査
    traverse(nums)

    # 要素を探索する
    index: int = find(nums, 3)
    print("nums で要素 3 を検索し、インデックス =", index)
