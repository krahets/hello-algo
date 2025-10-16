"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """挿入ソート"""
    # 外側のループ：ソート済み範囲は [0, i-1]
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # 内側のループ：base をソート済み範囲 [0, i-1] の正しい位置に挿入
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # nums[j] を右に1つ移動
            j -= 1
        nums[j + 1] = base  # base を正しい位置に代入


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("挿入ソート完了 nums =", nums)