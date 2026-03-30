"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """バブルソート"""
    n = len(nums)
    # 外側のループ：未ソート区間は [0, i]
    for i in range(n - 1, 0, -1):
        # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] を交換
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """バブルソート（フラグ最適化）"""
    n = len(nums)
    # 外側のループ：未ソート区間は [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # フラグを初期化する
        # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] を交換
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 交換する要素を記録
        if not flag:
            break  # このバブル処理で要素交換が一度もなければそのまま終了


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("バブルソート完了後 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("バブルソート完了後 nums =", nums1)
