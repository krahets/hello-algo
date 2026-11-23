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
    """Use a heap to find the k largest elements in an array"""
    # Initialize a min heap
    heap = []
    # Push the first k array elements onto the heap
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # Starting with element k+1, keep the heap size at k
    for i in range(k, len(nums)):
        # If the current element is larger than the heap top, pop the top element and push the current element
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"The {k} largest elements are")
    print_heap(res)
