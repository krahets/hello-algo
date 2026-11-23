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
    """힙을 이용하여 배열에서 가장 큰 k개 원소 탐색"""
    # 최소 힙 초기화
    heap = []
    # 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # k+1번째 원소부터 힙의 길이를 k로 유지한다
    for i in range(k, len(nums)):
        # 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""실행 코드"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"가장 큰 {k}개 원소")
    print_heap(res)
