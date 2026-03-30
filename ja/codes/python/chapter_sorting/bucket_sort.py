"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """バケットソート"""
    # k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. 配列要素を各バケットに振り分ける
    for num in nums:
        # 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
        i = int(num * k)
        # num をバケット i に追加
        buckets[i].append(num)
    # 2. 各バケットをソートする
    for bucket in buckets:
        # 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
        bucket.sort()
    # 3. バケットを走査して結果を結合
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # 入力データは範囲 [0, 1) の浮動小数点数とする
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("バケットソート完了後 nums =", nums)
