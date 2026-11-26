"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """원형 배열로 구현한 큐"""

    def __init__(self, size: int):
        """생성자"""
        self._nums: list[int] = [0] * size  # 큐의 원소를 저장하는 배열
        self._front: int = 0  # 맨 앞 원소를 가리키는 앞쪽 포인터
        self._size: int = 0  # 큐의 길이

    def capacity(self) -> int:
        """큐의 용량 조회"""
        return len(self._nums)

    def size(self) -> int:
        """큐의 길이 조회"""
        return self._size

    def is_empty(self) -> bool:
        """큐가 비어 있는지 확인"""
        return self._size == 0

    def push(self, num: int):
        """큐에 삽입"""
        if self._size == self.capacity():
            raise IndexError("큐가 가득 찼다")
        # 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        # 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        rear: int = (self._front + self._size) % self.capacity()
        # 맨 뒤에 num을 추가한다
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """큐에서 꺼내기"""
        num: int = self.peek()
        # 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """맨 앞 원소 조회"""
        if self.is_empty():
            raise IndexError("큐가 비어 있다")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """출력할 리스트 반환"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 큐 초기화
    queue = ArrayQueue(10)

    # 큐에 원소 삽입
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("큐 queue =", queue.to_list())

    # 맨 앞 원소 조회
    peek: int = queue.peek()
    print("맨 앞 원소 peek =", peek)

    # 큐에서 원소 꺼내기
    pop: int = queue.pop()
    print("꺼낸 원소 pop =", pop)
    print("꺼낸 후 queue =", queue.to_list())

    # 큐의 길이 조회
    size: int = queue.size()
    print("큐의 길이 size =", size)

    # 큐가 비어 있는지 확인
    is_empty: bool = queue.is_empty()
    print("큐가 비어 있는가 =", is_empty)

    # 원형 배열 테스트
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("반복", i, "— 삽입 + 삭제 후 queue = ", queue.to_list())
