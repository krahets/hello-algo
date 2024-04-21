"""
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListStack:
    """基於鏈結串列實現的堆疊"""

    def __init__(self):
        """建構子"""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """獲取堆疊的長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷堆疊是否為空"""
        return self._size == 0

    def push(self, val: int):
        """入堆疊"""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """出堆疊"""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """訪問堆疊頂元素"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._peek.val

    def to_list(self) -> list[int]:
        """轉化為串列用於列印"""
        arr = []
        node = self._peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


"""Driver Code"""
if __name__ == "__main__":
    # 初始化堆疊
    stack = LinkedListStack()

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
