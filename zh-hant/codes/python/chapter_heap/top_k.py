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
    """基於堆積查詢陣列中最大的 k 個元素"""
    # 初始化小頂堆積
    heap = []
    # 將陣列的前 k 個元素入堆積
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # 從第 k+1 個元素開始，保持堆積的長度為 k
    for i in range(k, len(nums)):
        # 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"最大的 {k} 個元素為")
    print_heap(res)
