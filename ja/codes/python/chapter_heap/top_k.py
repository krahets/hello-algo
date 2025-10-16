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
    """ヒープを使用して配列内の最大k個の要素を見つける"""
    # 最小ヒープを初期化
    heap = []
    # 配列の最初のk個の要素をヒープに入力
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # k+1番目の要素から、ヒープの長さをkに保つ
    for i in range(k, len(nums)):
        # 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""ドライバコード"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"最大の {k} 個の要素は")
    print_heap(res)