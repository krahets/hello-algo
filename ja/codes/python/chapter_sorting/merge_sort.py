"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """左部分配列と右部分配列をマージ"""
    # 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    # マージ結果を格納する一時配列 tmp を作成
    tmp = [0] * (right - left + 1)
    # 左右の部分配列の開始インデックスを初期化する
    i, j, k = left, mid + 1, 0
    # 左右の部分配列にまだ要素がある間は比較し、小さいほうを一時配列にコピーする
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # 左右の部分配列の残り要素を一時配列にコピーする
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # 一時配列 tmp の要素を元の配列 nums の対応区間にコピーする
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """マージソート"""
    # 終了条件
    if left >= right:
        return  # 部分配列の長さが 1 になったら再帰を終了
    # 分割フェーズ
    mid = (left + right) // 2 # 中点を計算
    merge_sort(nums, left, mid)  # 左部分配列を再帰処理
    merge_sort(nums, mid + 1, right)  # 右部分配列を再帰処理
    # マージフェーズ
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("マージソート完了後 nums =", nums)
