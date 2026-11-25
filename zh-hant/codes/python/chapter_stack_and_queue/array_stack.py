"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """以陣列實作堆疊"""

    def __init__(self):
        """初始化方法"""
        self._stack: list[int] = []

    def size(self) -> int:
        """取得堆疊長度"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """判斷堆疊是否為空"""
        return self.size() == 0

    def push(self, item: int):
        """推入堆疊"""
        self._stack.append(item)

    def pop(self) -> int:
        """彈出堆疊頂端的元素"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._stack.pop()

    def peek(self) -> int:
        """讀取堆疊頂端的元素"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """回傳串列以便輸出"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # 初始化堆疊
    stack = ArrayStack()

    # 將元素推入堆疊
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("堆疊 stack =", stack.to_list())

    # 讀取堆疊頂端的元素
    peek: int = stack.peek()
    print("堆疊頂端元素 peek =", peek)

    # 從堆疊彈出元素
    pop: int = stack.pop()
    print("彈出的元素 pop =", pop)
    print("彈出後 stack =", stack.to_list())

    # 取得堆疊長度
    size: int = stack.size()
    print("堆疊長度 size =", size)

    # 判斷堆疊是否為空
    is_empty: bool = stack.is_empty()
    print("堆疊是否為空 =", is_empty)
