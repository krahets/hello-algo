"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """選択ソート"""
    n = len(nums)
    # 外側のループ：未ソート範囲は [i, n-1]
    for i in range(n - 1):
        # 内側のループ：未ソート範囲内で最小要素を見つける
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # 最小要素のインデックスを記録
        # 最小要素を未ソート範囲の先頭要素と交換
        nums[i], nums[k] = nums[k], nums[i]


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("選択ソート完了 nums =", nums)