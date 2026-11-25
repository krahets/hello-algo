"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """원형 배열로 구현한 덱"""

    def __init__(self, capacity: int):
        """생성자"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """덱의 용량 조회"""
        return len(self._nums)

    def size(self) -> int:
        """덱의 길이 조회"""
        return self._size

    def is_empty(self) -> bool:
        """덱이 비어 있는지 확인"""
        return self._size == 0

    def index(self, i: int) -> int:
        """원형 배열의 인덱스 계산"""
        # 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
        # i가 배열의 끝을 넘으면 처음으로 돌아간다
        # i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """맨 앞에 삽입"""
        if self._size == self.capacity():
            print("덱이 가득 찼다")
            return
        # 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
        # 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
        self._front = self.index(self._front - 1)
        # 맨 앞에 num을 추가한다
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """맨 뒤에 삽입"""
        if self._size == self.capacity():
            print("덱이 가득 찼다")
            return
        # 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        rear = self.index(self._front + self._size)
        # 맨 뒤에 num을 추가한다
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """맨 앞에서 꺼내기"""
        num = self.peek_first()
        # 앞쪽 포인터를 한 칸 전진시킨다
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """맨 뒤에서 꺼내기"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """맨 앞 원소 조회"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """맨 뒤 원소 조회"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        # 맨 뒤 원소의 인덱스 계산
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """출력할 리스트 반환"""
        # 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 덱 초기화
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("덱 deque =", deque.to_array())

    # 원소 조회
    peek_first: int = deque.peek_first()
    print("맨 앞 원소 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("맨 뒤 원소 peek_last =", peek_last)

    # 덱에 원소 삽입
    deque.push_last(4)
    print("맨 뒤에 원소 4를 삽입한 후 deque =", deque.to_array())
    deque.push_first(1)
    print("맨 앞에 원소 1을 삽입한 후 deque =", deque.to_array())

    # 덱에서 원소 꺼내기
    pop_last: int = deque.pop_last()
    print("맨 뒤에서 꺼낸 원소 =", pop_last, ", 맨 뒤에서 꺼낸 후 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("맨 앞에서 꺼낸 원소 =", pop_first, ", 맨 앞에서 꺼낸 후 deque =", deque.to_array())

    # 덱의 길이 조회
    size: int = deque.size()
    print("덱의 길이 size =", size)

    # 덱이 비어 있는지 확인
    is_empty: bool = deque.is_empty()
    print("덱이 비어 있는가 =", is_empty)
