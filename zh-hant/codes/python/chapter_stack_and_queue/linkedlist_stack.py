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
    """以鏈結串列實作堆疊"""

    def __init__(self):
        """初始化方法"""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """取得堆疊長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷堆疊是否為空"""
        return self._size == 0

    def push(self, val: int):
        """推入堆疊"""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """彈出堆疊頂端的元素"""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """讀取堆疊頂端的元素"""
        if self.is_empty():
            raise IndexError("堆疊為空")
        return self._peek.val

    def to_list(self) -> list[int]:
        """轉成串列以便輸出"""
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
