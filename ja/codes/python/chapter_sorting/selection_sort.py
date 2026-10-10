"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """選択ソート"""
    n = len(nums)
    # 外側ループ：未整列区間は [i, n-1]
    for i in range(n - 1):
        # 内側のループ：未ソート区間の最小要素を見つける
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # 最小要素のインデックスを記録
        # その最小要素を未整列区間の先頭要素と交換する
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("選択ソート完了後 nums =", nums)
