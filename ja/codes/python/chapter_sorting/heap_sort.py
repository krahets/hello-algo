"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """長さ n のヒープで、ノード i から下向きにヒープ化"""
    while True:
        # ノード i, l, r のうち値が最大のものを ma とする
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # i の値が最大か、左右の子のインデックス l, r がともに範囲外なら、ヒープ化を終了
        if ma == i:
            break
        # 2 つのノードを交換
        nums[i], nums[ma] = nums[ma], nums[i]
        # 下向きのヒープ化を繰り返す
        i = ma


def heap_sort(nums: list[int]):
    """ヒープソート"""
    # ヒープの構築：葉以外のすべてのノードをヒープ化
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # ヒープから最大要素を取り出す操作を n-1 回繰り返す
    for i in range(len(nums) - 1, 0, -1):
        # 根と右端の葉を交換（先頭要素と末尾要素の交換）
        nums[0], nums[i] = nums[i], nums[0]
        # 根から下向きにヒープ化
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("ヒープソート後の nums =", nums)
