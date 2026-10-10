"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """ヒープの長さは n。ノード i から下方向にヒープ化"""
    while True:
        # ノード i, l, r のうち値が最大のノードを ma とする
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if ma == i:
            break
        # 2 つのノードを交換
        nums[i], nums[ma] = nums[ma], nums[i]
        # ループで上から下へヒープ化
        i = ma


def heap_sort(nums: list[int]):
    """ヒープソート"""
    # ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # ヒープから最大要素を取り出し、n-1 回繰り返す
    for i in range(len(nums) - 1, 0, -1):
        # 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        nums[0], nums[i] = nums[i], nums[0]
        # 根ノードを起点に、上から下へヒープ化
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("ヒープソート完了後 nums =", nums)
