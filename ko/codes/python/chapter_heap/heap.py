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
    print(f"\n원소를 힙에 삽입한 후(원소: {val})")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 힙의 루트 원소 꺼내기
    print(f"\n힙의 루트 원소를 꺼낸 후(원소: {val})")
    print_heap([flag * val for val in heap])


"""실행 코드"""
if __name__ == "__main__":
    # 최소 힙 초기화
    min_heap, flag = [], 1
    # 최대 힙 초기화
    max_heap, flag = [], -1

    print("\n다음 테스트 예제는 최대 힙이다")
    # Python의 heapq 모듈은 기본적으로 최소 힙을 구현한다
    # 원소의 부호를 바꾸어 힙에 삽입하면 대소 관계가 뒤집히므로 최대 힙을 구현할 수 있다
    # 이 예제에서 flag = 1은 최소 힙에, flag = -1은 최대 힙에 해당한다

    # 힙에 원소 삽입
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # 힙의 루트 원소 반환
    peek: int = flag * max_heap[0]
    print(f"\n힙의 루트 원소는 {peek}이다")

    # 힙의 루트 원소 꺼내기
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # 힙 크기 반환
    size: int = len(max_heap)
    print(f"\n힙의 원소 개수는 {size}개이다")

    # 힙이 비어 있는지 판단
    is_empty: bool = not max_heap
    print(f"\n힙이 비어 있는가 {is_empty}")

    # 리스트를 입력하여 힙 구성
    # 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n리스트를 입력하여 최소 힙을 구성한 후")
    print_heap(min_heap)
