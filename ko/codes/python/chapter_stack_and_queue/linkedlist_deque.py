"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """이중 연결 리스트 노드"""

    def __init__(self, val: int):
        """생성자"""
        self.val: int = val
        self.next: ListNode | None = None  # 다음 노드 참조
        self.prev: ListNode | None = None  # 이전 노드 참조


class LinkedListDeque:
    """이중 연결 리스트로 구현한 덱"""

    def __init__(self):
        """생성자"""
        self._front: ListNode | None = None  # 머리 노드 front
        self._rear: ListNode | None = None  # 꼬리 노드 rear
        self._size: int = 0  # 덱의 길이

    def size(self) -> int:
        """덱의 길이 반환"""
        return self._size

    def is_empty(self) -> bool:
        """덱이 비어 있는지 판단"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """큐 삽입 연산"""
        node = ListNode(num)
        # 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if self.is_empty():
            self._front = self._rear = node
        # 맨 앞에 삽입하는 연산
        elif is_front:
            # node를 연결 리스트의 맨 앞에 추가한다
            self._front.prev = node
            node.next = self._front
            self._front = node  # 머리 노드를 갱신한다
        # 맨 뒤에 삽입하는 연산
        else:
            # node를 연결 리스트의 맨 뒤에 추가한다
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 꼬리 노드를 갱신한다
        self._size += 1  # 큐 길이를 갱신한다

    def push_first(self, num: int):
        """맨 앞에 삽입"""
        self.push(num, True)

    def push_last(self, num: int):
        """맨 뒤에 삽입"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """큐에서 꺼내는 연산"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        # 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # 맨 앞에서 꺼내는 연산
        elif is_front:
            val: int = self._front.val  # 머리 노드의 값을 임시로 저장한다
            # 머리 노드를 삭제한다
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # 머리 노드를 갱신한다
        # 맨 뒤에서 꺼내는 연산
        else:
            val: int = self._rear.val  # 꼬리 노드의 값을 임시로 저장한다
            # 꼬리 노드를 삭제한다
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # 꼬리 노드를 갱신한다
        self._size -= 1  # 큐 길이를 갱신한다
        return val

    def pop_first(self) -> int:
        """맨 앞에서 꺼내기"""
        return self.pop(True)

    def pop_last(self) -> int:
        """맨 뒤에서 꺼내기"""
        return self.pop(False)

    def peek_first(self) -> int:
        """맨 앞 원소 접근"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        return self._front.val

    def peek_last(self) -> int:
        """맨 뒤 원소 접근"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        return self._rear.val

    def to_array(self) -> list[int]:
        """출력에 사용할 배열 반환"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""실행 코드"""
if __name__ == "__main__":
    # 덱 초기화
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("덱 deque =", deque.to_array())

    # 원소 접근
    peek_first: int = deque.peek_first()
    print("맨 앞 원소 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("맨 뒤 원소 peek_last =", peek_last)

    # 큐에 원소 삽입
    deque.push_last(4)
    print("원소 4를 맨 뒤에 삽입한 후 deque =", deque.to_array())
    deque.push_first(1)
    print("원소 1을 맨 앞에 삽입한 후 deque =", deque.to_array())

    # 큐에서 원소 꺼내기
    pop_last: int = deque.pop_last()
    print("맨 뒤에서 꺼낸 원소 =", pop_last, ", 맨 뒤에서 꺼낸 후 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("맨 앞에서 꺼낸 원소 =", pop_first, ", 맨 앞에서 꺼낸 후 deque =", deque.to_array())

    # 덱의 길이 반환
    size: int = deque.size()
    print("덱 길이 size =", size)

    # 덱이 비어 있는지 판단
    is_empty: bool = deque.is_empty()
    print("덱이 비어 있는가 =", is_empty)
