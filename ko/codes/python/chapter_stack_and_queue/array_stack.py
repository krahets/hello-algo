"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """배열로 구현한 스택"""

    def __init__(self):
        """생성자"""
        self._stack: list[int] = []

    def size(self) -> int:
        """스택의 길이 조회"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """스택이 비어 있는지 확인"""
        return self.size() == 0

    def push(self, item: int):
        """스택에 삽입"""
        self._stack.append(item)

    def pop(self) -> int:
        """스택에서 꺼내기"""
        if self.is_empty():
            raise IndexError("스택이 비어 있다")
        return self._stack.pop()

    def peek(self) -> int:
        """스택 맨 위의 원소 조회"""
        if self.is_empty():
            raise IndexError("스택이 비어 있다")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """출력할 리스트 반환"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # 스택 초기화
    stack = ArrayStack()

    # 스택에 원소 삽입
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("스택 stack =", stack.to_list())

    # 스택 맨 위의 원소 조회
    peek: int = stack.peek()
    print("맨 위 원소 peek =", peek)

    # 스택에서 원소 꺼내기
    pop: int = stack.pop()
    print("꺼낸 원소 pop =", pop)
    print("꺼낸 후 stack =", stack.to_list())

    # 스택의 길이 조회
    size: int = stack.size()
    print("스택의 길이 size =", size)

    # 비어 있는지 확인
    is_empty: bool = stack.is_empty()
    print("스택이 비어 있는가 =", is_empty)
