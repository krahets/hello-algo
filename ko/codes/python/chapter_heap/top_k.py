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
    """힙을 이용해 배열에서 가장 큰 원소 k개 찾기"""
    # 최소 힙 초기화
    heap = []
    # 배열의 처음 k개 원소를 힙에 삽입
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # k+1번째 원소부터 힙의 크기를 k로 유지
    for i in range(k, len(nums)):
        # 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"가장 큰 원소 {k}개:")
    print_heap(res)
