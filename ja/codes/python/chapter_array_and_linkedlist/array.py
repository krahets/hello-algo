"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """要素にランダムアクセスする"""
    # 区間 [0, len(nums)-1] から数値をランダムに 1 つ選ぶ
    random_index = random.randint(0, len(nums) - 1)
    # ランダムに選んだ要素を取得して返す
    random_num = nums[random_index]
    return random_num


# Python の list は動的配列なので、そのまま拡張できることに注意
# 学習しやすいように、この関数では list を長さが変わらない配列として扱う
def extend(nums: list[int], enlarge: int) -> list[int]:
    """配列の長さを拡張する"""
    # 拡張後の長さの配列を初期化する
    res = [0] * (len(nums) + enlarge)
    # 元の配列の全要素を新しい配列にコピーする
    for i in range(len(nums)):
        res[i] = nums[i]
    # 拡張後の新しい配列を返す
    return res


def insert(nums: list[int], num: int, index: int):
    """配列のインデックス index に要素 num を挿入する"""
    # インデックス index 以降の全要素を 1 つ後ろにずらす
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # インデックス index の要素に num を代入する
    nums[index] = num


def remove(nums: list[int], index: int):
    """インデックス index の要素を削除する"""
    # インデックス index より後の全要素を 1 つ前にずらす
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """配列を走査する"""
    count = 0
    # インデックスを使って配列を走査する
    for i in range(len(nums)):
        count += nums[i]
    # 配列の要素を直接走査する
    for num in nums:
        count += num
    # データのインデックスと要素を同時に走査する
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """配列から指定した要素を探索する"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""実行用コード"""
if __name__ == "__main__":
    # 配列を初期化する
    arr = [0] * 5
    print("配列 arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("配列 nums =", nums)

    # ランダムアクセス
    random_num: int = random_access(nums)
    print("nums からランダムに取得した要素", random_num)

    # 長さの拡張
    nums: list[int] = extend(nums, 3)
    print("配列の長さを 8 に拡張した結果 nums =", nums)

    # 要素を挿入する
    insert(nums, 6, 3)
    print("インデックス 3 に数値 6 を挿入した結果 nums =", nums)

    # 要素を削除する
    remove(nums, 2)
    print("インデックス 2 の要素を削除した結果 nums =", nums)

    # 配列を走査する
    traverse(nums)

    # 要素を探索する
    index: int = find(nums, 3)
    print("nums から要素 3 を探索した結果のインデックス =", index)
