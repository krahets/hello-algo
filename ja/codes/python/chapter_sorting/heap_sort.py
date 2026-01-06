"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """ヒープの長さが n、ノード i から上から下へヒープ化を開始"""
    while True:
        # i、l、r の中で最大のノードを判定し、ma とする
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # ノード i が最大または l、r のインデックスが範囲外の場合、さらなるヒープ化は不要、ループを抜ける
        if ma == i:
            break
        # 2つのノードを交換
        nums[i], nums[ma] = nums[ma], nums[i]
        # 下向きにヒープ化をループ
        i = ma


def heap_sort(nums: list[int]):
    """ヒープソート"""
    # ヒープ構築操作：葉ノード以外のすべてのノードをヒープ化
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # ヒープから最大要素を抽出し、n-1 回繰り返す
    for i in range(len(nums) - 1, 0, -1):
        # ルートノードと最も右の葉ノードを交換（最初の要素と最後の要素を交換）
        nums[0], nums[i] = nums[i], nums[0]
        # ルートノードから上から下へヒープ化を開始
        sift_down(nums, i, 0)


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("ヒープソート完了 nums =", nums)