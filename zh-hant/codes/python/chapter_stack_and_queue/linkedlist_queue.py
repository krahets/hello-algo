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
    """以鏈結串列實作佇列"""

    def __init__(self):
        """初始化方法"""
        self._front: ListNode | None = None  # _front 指向首節點
        self._rear: ListNode | None = None  # _rear 指向尾節點
        self._size: int = 0

    def size(self) -> int:
        """取得佇列長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷佇列是否為空"""
        return self._size == 0

    def push(self, num: int):
        """入隊"""
        # 建立存有 num 的新節點，準備接到隊尾
        node = ListNode(num)
        # 若佇列為空，讓隊首與隊尾都指向新節點
        if self._front is None:
            self._front = node
            self._rear = node
        # 若佇列非空，將新節點接在尾節點之後
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """出隊"""
        num = self.peek()
        # 移除首節點
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """讀取隊首元素"""
        if self.is_empty():
            raise IndexError("佇列為空")
        return self._front.val

    def to_list(self) -> list[int]:
        """轉成串列以便輸出"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # 初始化佇列
    queue = LinkedListQueue()

    # 將元素加入佇列
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("佇列 queue =", queue.to_list())

    # 讀取隊首元素
    peek: int = queue.peek()
    print("隊首元素 front =", peek)

    # 從佇列取出元素
    pop_front: int = queue.pop()
    print("出隊元素 pop =", pop_front)
    print("出隊後 queue =", queue.to_list())

    # 取得佇列長度
    size: int = queue.size()
    print("佇列長度 size =", size)

    # 判斷佇列是否為空
    is_empty: bool = queue.is_empty()
    print("佇列是否為空 =", is_empty)
