"""
File: top_k.py
Created Time: 2023-06-10
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


def top_k_heap(nums: list[int], k: int) -> list[int]:
    """ヒープを使って配列の上位 k 個の要素を求める"""
    # 最小ヒープを初期化する
    heap = []
    # 配列の先頭 k 個の要素をヒープに入れる
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # k+1 番目の要素からはヒープのサイズを k に保つ
    for i in range(k, len(nums)):
        # 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"上位 {k} 個の要素：")
    print_heap(res)
