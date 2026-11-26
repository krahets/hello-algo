"""
File: my_heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap


class MaxHeap:
    """최대 힙"""

    def __init__(self, nums: list[int]):
        """입력 리스트로 힙을 만드는 생성자"""
        # 리스트의 원소를 그대로 힙에 추가
        self.max_heap = nums
        # 리프를 제외한 모든 노드에서 힙 복구
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """왼쪽 자식 노드의 인덱스 구하기"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """오른쪽 자식 노드의 인덱스 구하기"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """부모 노드의 인덱스 구하기"""
        return (i - 1) // 2  # 나눗셈 결과를 내림

    def swap(self, i: int, j: int):
        """원소 교환"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """힙 크기 구하기"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """힙이 비었는지 확인"""
        return self.size() == 0

    def peek(self) -> int:
        """힙의 루트 원소 조회"""
        return self.max_heap[0]

    def push(self, val: int):
        """힙에 원소 삽입"""
        # 노드 추가
        self.max_heap.append(val)
        # 아래에서 위로 힙 복구
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """노드 i부터 아래에서 위로 힙 복구"""
        while True:
            # 노드 i의 부모 노드 구하기
            p = self.parent(i)
            # 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 두 노드 교환
            self.swap(i, p)
            # 위로 올라가며 힙 복구 반복
            i = p

    def pop(self) -> int:
        """힙에서 원소 꺼내기"""
        # 빈 힙 처리
        if self.is_empty():
            raise IndexError("힙이 비어 있음")
        # 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1)
        # 노드 삭제
        val = self.max_heap.pop()
        # 위에서 아래로 힙 복구
        self.sift_down(0)
        # 힙의 루트 원소 반환
        return val

    def sift_down(self, i: int):
        """노드 i부터 위에서 아래로 힙 복구"""
        while True:
            # 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if ma == i:
                break
            # 두 노드 교환
            self.swap(i, ma)
            # 아래로 내려가며 힙 복구 반복
            i = ma

    def print(self):
        """힙 출력(이진 트리)"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # 최대 힙 초기화
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n입력 리스트로 만든 힙:")
    max_heap.print()

    # 힙의 루트 원소 구하기
    peek = max_heap.peek()
    print(f"\n힙의 루트 원소: {peek}")

    # 힙에 원소 삽입
    val = 7
    max_heap.push(val)
    print(f"\n원소 {val} 삽입 후")
    max_heap.print()

    # 힙의 루트 원소 꺼내기
    peek = max_heap.pop()
    print(f"\n루트 원소 {peek} 제거 후")
    max_heap.print()

    # 힙 크기 구하기
    size = max_heap.size()
    print(f"\n힙의 원소 수: {size}")

    # 힙이 비었는지 확인
    is_empty = max_heap.is_empty()
    print(f"\n빈 힙 여부: {is_empty}")
