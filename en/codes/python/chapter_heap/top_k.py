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
    """Find the largest k elements in array based on heap"""
    # Initialize min heap
    heap = []
    # Enter the first k elements of array into heap
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # Starting from the (k+1)th element, maintain heap length as k
    for i in range(k, len(nums)):
        # If current element is greater than top element, top element exits heap, current element enters heap
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"The largest {k} elements are")
    print_heap(res)
