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
        """덱의 용량 반환"""
        return len(self._nums)

    def size(self) -> int:
        """덱의 길이 반환"""
        return self._size

    def is_empty(self) -> bool:
        """덱이 비어 있는지 판단"""
        return self._size == 0

    def index(self, i: int) -> int:
        """원형 배열 인덱스 계산"""
        # 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        # i가 배열의 끝을 넘어가면 처음으로 돌아온다
        # i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """맨 앞에 삽입"""
        if self._size == self.capacity():
            print("덱이 가득 찼다")
            return
        # 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        # 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        self._front = self.index(self._front - 1)
        # num을 맨 앞에 추가한다
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """맨 뒤에 삽입"""
        if self._size == self.capacity():
            print("덱이 가득 찼다")
            return
        # 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        rear = self.index(self._front + self._size)
        # num을 맨 뒤에 추가한다
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """맨 앞에서 꺼내기"""
        num = self.peek_first()
        # 맨 앞 포인터를 뒤로 한 칸 이동한다
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """맨 뒤에서 꺼내기"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """맨 앞 원소 접근"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """맨 뒤 원소 접근"""
        if self.is_empty():
            raise IndexError("덱이 비어 있다")
        # 마지막 원소의 인덱스를 계산한다
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """출력에 사용할 배열 반환"""
        # 유효한 길이 범위 안의 리스트 원소만 변환한다
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""실행 코드"""
if __name__ == "__main__":
    # 덱 초기화
    deque = ArrayDeque(10)
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
