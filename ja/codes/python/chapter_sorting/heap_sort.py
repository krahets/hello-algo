"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """長さ n のヒープを、ノード i から下向きにヒープ化する"""
    while True:
        # ノード i, l, r のうち値が最大のノードを求め、ma とする
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if ma == i:
            break
        # 2 つのノードを交換する
        nums[i], nums[ma] = nums[ma], nums[i]
        # 下向きのヒープ化を繰り返す
        i = ma


def heap_sort(nums: list[int]):
    """ヒープソート"""
    # ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for i in range(len(nums) - 1, 0, -1):
        # 根と最右の葉を交換（先頭要素と末尾要素を交換）
        nums[0], nums[i] = nums[i], nums[0]
        # 根ノードから下向きにヒープ化する
        sift_down(nums, i, 0)


"""実行用コード"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("ヒープソート完了後 nums =", nums)
