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
    """基於鏈結串列實現的佇列"""

    def __init__(self):
        """建構子"""
        self._front: ListNode | None = None  # 頭節點 front
        self._rear: ListNode | None = None  # 尾節點 rear
        self._size: int = 0

    def size(self) -> int:
        """獲取佇列的長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷佇列是否為空"""
        return self._size == 0

    def push(self, num: int):
        """入列"""
        # 在尾節點後新增 num
        node = ListNode(num)
        # 如果佇列為空，則令頭、尾節點都指向該節點
        if self._front is None:
            self._front = node
            self._rear = node
        # 如果佇列不為空，則將該節點新增到尾節點後
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """出列"""
        num = self.peek()
        # 刪除頭節點
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """訪問佇列首元素"""
        if self.is_empty():
            raise IndexError("佇列為空")
        return self._front.val

    def to_list(self) -> list[int]:
        """轉化為串列用於列印"""
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

    # 元素入列
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("佇列 queue =", queue.to_list())

    # 訪問佇列首元素
    peek: int = queue.peek()
    print("佇列首元素 front =", peek)

    # 元素出列
    pop_front: int = queue.pop()
    print("出列元素 pop =", pop_front)
    print("出列後 queue =", queue.to_list())

    # 獲取佇列的長度
    size: int = queue.size()
    print("佇列長度 size =", size)

    # 判斷佇列是否為空
    is_empty: bool = queue.is_empty()
    print("佇列是否為空 =", is_empty)
