"""
File: bucket_sort.py
Created Time: 2023-03-30
Author: krahets (krahets@163.com)
"""


def bucket_sort(nums: list[float]):
    """バケットソート"""
    # k = n/2 個のバケットを初期化、各バケットに平均2個の要素を配置することを期待
    k = len(nums) // 2
    buckets = [[] for _ in range(k)]
    # 1. 配列要素を各バケットに分散
    for num in nums:
        # 入力データ範囲は [0, 1)、num * k を使用してインデックス範囲 [0, k-1] にマッピング
        i = int(num * k)
        # num をバケット i に追加
        buckets[i].append(num)
    # 2. 各バケットをソート
    for bucket in buckets:
        # 組み込みソート関数を使用、他のソートアルゴリズムに置き換えることも可能
        bucket.sort()
    # 3. バケットを走査して結果をマージ
    i = 0
    for bucket in buckets:
        for num in bucket:
            nums[i] = num
            i += 1


if __name__ == "__main__":
    # 入力データが浮動小数点数、範囲 [0, 1) であると仮定
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucket_sort(nums)
    print("バケットソート完了 nums =", nums)