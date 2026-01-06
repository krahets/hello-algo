"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """バブルソート"""
    n = len(nums)
    # 外側のループ：未ソート範囲は [0, i]
    for i in range(n - 1, 0, -1):
        # 内側のループ：未ソート範囲 [0, i] の最大要素を範囲の右端に移動
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] を交換
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """バブルソート（フラグによる最適化）"""
    n = len(nums)
    # 外側のループ：未ソート範囲は [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # フラグを初期化
        # 内側のループ：未ソート範囲 [0, i] の最大要素を範囲の右端に移動
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] を交換
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 要素を交換したことを記録
        if not flag:
            break  # この回の「バブリング」で要素が交換されなかった場合、終了


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("バブルソート完了 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("バブルソート完了 nums =", nums1)