"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """左サブ配列と右サブ配列をマージ"""
    # 左サブ配列区間は [left, mid]、右サブ配列区間は [mid+1, right]
    # 一時配列 tmp を作成してマージ結果を格納
    tmp = [0] * (right - left + 1)
    # 左右サブ配列の開始インデックスを初期化
    i, j, k = left, mid + 1, 0
    # 両方のサブ配列に要素が残っている間、より小さい要素を一時配列にコピー
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # 残った左右サブ配列の要素を一時配列にコピー
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーバック
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """マージソート"""
    # 終了条件
    if left >= right:
        return  # サブ配列の長さが1のときに再帰を終了
    # 分割段階
    mid = left + (right - left) // 2  # 中点を計算
    merge_sort(nums, left, mid)  # 左サブ配列を再帰的に処理
    merge_sort(nums, mid + 1, right)  # 右サブ配列を再帰的に処理
    # マージ段階
    merge(nums, left, mid, right)


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("マージソート完了 nums =", nums)