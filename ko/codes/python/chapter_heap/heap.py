"""
File: heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


def test_push(heap: list, val: int, flag: int = 1):
    heapq.heappush(heap, flag * val)  # 힙에 원소 삽입
    print(f"\n원소 {val} 삽입 후")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 힙의 루트 원소 꺼내기
    print(f"\n루트 원소 {val} 제거 후")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 최소 힙 초기화
    min_heap, flag = [], 1
    # 최대 힙 초기화
    max_heap, flag = [], -1

    print("\n다음은 최대 힙 테스트 예제다.")
    # Python의 heapq 모듈은 기본적으로 최소 힙을 구현함
    # 원소의 부호를 바꿔 넣으면 대소 관계가 뒤집혀 최대 힙을 구현할 수 있음
    # 이 예제에서 flag = 1은 최소 힙, flag = -1은 최대 힙에 해당

    # 힙에 원소 삽입
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # 힙의 루트 원소 구하기
    peek: int = flag * max_heap[0]
    print(f"\n힙의 루트 원소: {peek}")

    # 힙의 루트 원소 꺼내기
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # 힙 크기 구하기
    size: int = len(max_heap)
    print(f"\n힙의 원소 수: {size}")

    # 힙이 비었는지 확인
    is_empty: bool = not max_heap
    print(f"\n빈 힙 여부: {is_empty}")

    # 입력 리스트로 힙 구성
    # 시간 복잡도는 O(nlogn)이 아니라 O(n)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n입력 리스트로 만든 최소 힙:")
    print_heap(min_heap)
