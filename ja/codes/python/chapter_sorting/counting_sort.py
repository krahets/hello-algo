"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """計数ソート"""
    # シンプルな実装、オブジェクトのソートには使用できない
    # 1. 配列内の最大要素 m を統計
    m = 0
    for num in nums:
        m = max(m, num)
    # 2. 各数字の出現回数を統計
    # counter[num] は num の出現回数を表す
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter を走査し、各要素を元の配列 nums に埋め戻し
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """計数ソート"""
    # 完全な実装、オブジェクトのソートが可能で、安定ソート
    # 1. 配列内の最大要素 m を統計
    m = max(nums)
    # 2. 各数字の出現回数を統計
    # counter[num] は num の出現回数を表す
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter の前置和を計算し、「出現回数」を「末尾インデックス」に変換
    # counter[num]-1 は res において num が最後に出現するインデックス
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. nums を逆順に走査し、各要素を結果配列 res に配置
    # 結果を記録するための配列 res を初期化
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # num を対応するインデックスに配置
        counter[num] -= 1  # 前置和を1減らし、num を配置する次のインデックスを取得
    # 結果配列 res を使用して元の配列 nums を上書き
    for i in range(n):
        nums[i] = res[i]


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"計数ソート（オブジェクトソート不可）完了 nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"計数ソート完了 nums1 = {nums1}")