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
        """생성자: 입력 리스트를 바탕으로 힙 구성"""
        # 리스트 원소를 그대로 힙에 추가한다
        self.max_heap = nums
        # 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """왼쪽 자식 노드의 인덱스 반환"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """오른쪽 자식 노드의 인덱스 반환"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """부모 노드의 인덱스 반환"""
        return (i - 1) // 2  # 나눗셈의 결과를 내림한다

    def swap(self, i: int, j: int):
        """원소 교환"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """힙 크기 반환"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """힙이 비어 있는지 판단"""
        return self.size() == 0

    def peek(self) -> int:
        """힙의 루트 원소 접근"""
        return self.max_heap[0]

    def push(self, val: int):
        """힙에 원소 삽입"""
        # 노드 추가
        self.max_heap.append(val)
        # 아래에서 위로 힙을 재정렬한다
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """노드 i에서 시작하여 아래에서 위로 힙 재정렬"""
        while True:
            # 노드 i의 부모 노드를 구한다
            p = self.parent(i)
            # 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # 두 노드를 교환한다
            self.swap(i, p)
            # 위쪽으로 힙 재정렬을 반복한다
            i = p

    def pop(self) -> int:
        """힙에서 원소 꺼내기"""
        # 비어 있는 경우를 처리한다
        if self.is_empty():
            raise IndexError("힙이 비어 있다")
        # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        self.swap(0, self.size() - 1)
        # 노드 삭제
        val = self.max_heap.pop()
        # 위에서 아래로 힙을 재정렬한다
        self.sift_down(0)
        # 힙의 루트 원소를 반환한다
        return val

    def sift_down(self, i: int):
        """노드 i에서 시작하여 위에서 아래로 힙 재정렬"""
        while True:
            # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i:
                break
            # 두 노드를 교환한다
            self.swap(i, ma)
            # 아래쪽으로 힙 재정렬을 반복한다
            i = ma

    def print(self):
        """힙 출력(이진 트리)"""
        print_heap(self.max_heap)


"""실행 코드"""
if __name__ == "__main__":
    # 최대 힙 초기화
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\n리스트를 입력하여 힙을 구성한 후")
    max_heap.print()

    # 힙의 루트 원소 반환
    peek = max_heap.peek()
    print(f"\n힙의 루트 원소는 {peek}이다")

    # 힙에 원소 삽입
    val = 7
    max_heap.push(val)
    print(f"\n원소를 힙에 삽입한 후(원소: {val})")
    max_heap.print()

    # 힙의 루트 원소 꺼내기
    peek = max_heap.pop()
    print(f"\n힙의 루트 원소를 꺼낸 후(원소: {peek})")
    max_heap.print()

    # 힙 크기 반환
    size = max_heap.size()
    print(f"\n힙의 원소 개수는 {size}개이다")

    # 힙이 비어 있는지 판단
    is_empty = max_heap.is_empty()
    print(f"\n힙이 비어 있는가 {is_empty}")
