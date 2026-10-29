"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """カウントソート"""
    # 簡易実装。オブジェクトのソートには使えない
    # 1. 配列の最大要素 m を求める
    m = max(nums)
    # 2. 各数値の出現回数を数える
    # counter[num] は num の出現回数を表す
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter を走査し、各要素を元の配列 nums に入れる
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """カウントソート"""
    # 完全な実装。オブジェクトをソートでき、安定ソートである
    # 1. 配列の最大要素 m を求める
    m = max(nums)
    # 2. 各数値の出現回数を数える
    # counter[num] は num の出現回数を表す
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter の累積和を求め、「出現回数」を「末尾のインデックス」に変換する
    # つまり、counter[num]-1 は res 内で num が最後に現れるインデックスである
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. nums を逆順に走査し、各要素を結果配列 res に入れる
    # 結果を記録する配列 res を初期化する
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # 対応するインデックスに num を配置する
        counter[num] -= 1  # 累積和を 1 減らし、次に num を配置するインデックスを求める
    # 結果配列 res で元の配列 nums を上書きする
    for i in range(n):
        nums[i] = res[i]


"""実行用コード"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"カウントソート（オブジェクトはソート不可）の完了後 nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"カウントソート完了後 nums1 = {nums1}")
