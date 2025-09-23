"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """要素へのランダムアクセス"""
    # 区間 [0, len(nums)-1] から数値をランダムに選択
    random_index = random.randint(0, len(nums) - 1)
    # ランダムな要素を取得して返す
    random_num = nums[random_index]
    return random_num


# PythonのlistはextendできるDynamic Arrayであることに注意
# 学習を容易にするため、この関数ではlistをStatic Arrayとして扱う
def extend(nums: list[int], enlarge: int) -> list[int]:
    """配列の長さを拡張"""
    # 拡張された長さの配列を初期化
    res = [0] * (len(nums) + enlarge)
    # 元の配列のすべての要素を新しい配列にコピー
    for i in range(len(nums)):
        res[i] = nums[i]
    # 拡張後の新しい配列を返す
    return res


def insert(nums: list[int], num: int, index: int):
    """インデックス index に要素 num を挿入"""
    # インデックス index より後のすべての要素を1つ後ろに移動
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # num を index の位置の要素に代入
    nums[index] = num


def remove(nums: list[int], index: int):
    """インデックス index の要素を削除"""
    # インデックス index より後のすべての要素を1つ前に移動
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """配列の走査"""
    count = 0
    # インデックスによる配列の走査
    for i in range(len(nums)):
        count += nums[i]
    # 配列要素の走査
    for num in nums:
        count += num
    # データのインデックスと要素の両方を走査
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """配列内の指定された要素を検索"""
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
    print("nums のランダムな要素を取得", random_num)

    # 長さの拡張
    nums: list[int] = extend(nums, 3)
    print("配列の長さを 8 に拡張、結果は nums =", nums)

    # 要素の挿入
    insert(nums, 6, 3)
    print("インデックス 3 に数値 6 を挿入、結果は nums =", nums)

    # 要素の削除
    remove(nums, 2)
    print("インデックス 2 の要素を削除、結果は nums =", nums)

    # 配列の走査
    traverse(nums)

    # 要素の検索
    index: int = find(nums, 3)
    print("nums で要素 3 を検索、結果は index =", index)