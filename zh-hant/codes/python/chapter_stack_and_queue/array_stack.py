"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """基於陣列實現的堆疊"""

    def __init__(self):
        """建構子"""
        self._stack: list[int] = []

    def size(self) -> int:
        """獲取堆疊的長度"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """判斷堆疊是否為空"""
        return self._size == 0

    def push(self, item: int):
        """入堆疊"""
        self._stack.append(item)

    def pop(self) -> int:
        """出堆疊"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._stack.pop()

    def peek(self) -> int:
        """訪問堆疊頂元素"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """返回串列用於列印"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # 初始化堆疊
    stack = ArrayStack()

    # 元素入堆疊
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("堆疊 stack =", stack.to_list())

    # 訪問堆疊頂元素
    peek: int = stack.peek()
    print("堆疊頂元素 peek =", peek)

    # 元素出堆疊
    pop: int = stack.pop()
    print("出堆疊元素 pop =", pop)
    print("出堆疊後 stack =", stack.to_list())

    # 獲取堆疊的長度
    size: int = stack.size()
    print("堆疊的長度 size =", size)

    # 判斷是否為空
    is_empty: bool = stack.is_empty()
    print("堆疊是否為空 =", is_empty)
