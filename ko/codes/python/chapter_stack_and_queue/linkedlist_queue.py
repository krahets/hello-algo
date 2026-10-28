"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListQueue:
    """연결 리스트로 구현한 큐"""

    def __init__(self):
        """생성자"""
        self._front: ListNode | None = None  # 머리 노드 front
        self._rear: ListNode | None = None  # 꼬리 노드 rear
        self._size: int = 0

    def size(self) -> int:
        """큐의 길이 반환"""
        return self._size

    def is_empty(self) -> bool:
        """큐가 비어 있는지 판단"""
        return self._size == 0

    def push(self, num: int):
        """큐에 삽입"""
        # 꼬리 노드 뒤에 num을 추가한다
        node = ListNode(num)
        # 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
        if self._front is None:
            self._front = node
            self._rear = node
        # 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """큐에서 꺼내기"""
        num = self.peek()
        # 머리 노드를 삭제한다
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """맨 앞 원소 접근"""
        if self.is_empty():
            raise IndexError("큐가 비어 있다")
        return self._front.val

    def to_list(self) -> list[int]:
        """출력에 사용할 리스트로 변환"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""실행 코드"""
if __name__ == "__main__":
    # 큐 초기화
    queue = LinkedListQueue()

    # 큐에 원소 삽입
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("큐 queue =", queue.to_list())

    # 맨 앞 원소 접근
    peek: int = queue.peek()
    print("맨 앞 원소 front =", peek)

    # 큐에서 원소 꺼내기
    pop_front: int = queue.pop()
    print("큐에서 꺼낸 원소 pop =", pop_front)
    print("큐에서 꺼낸 후 queue =", queue.to_list())

    # 큐의 길이 반환
    size: int = queue.size()
    print("큐 길이 size =", size)

    # 큐가 비어 있는지 판단
    is_empty: bool = queue.is_empty()
    print("큐가 비어 있는가 =", is_empty)
