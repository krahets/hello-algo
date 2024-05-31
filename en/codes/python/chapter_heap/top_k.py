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
    """Using heap to find the largest k elements in an array"""
    # Initialize min-heap
    heap = []
    # Enter the first k elements of the array into the heap
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # From the k+1th element, keep the heap length as k
    for i in range(k, len(nums)):
        # If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
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
