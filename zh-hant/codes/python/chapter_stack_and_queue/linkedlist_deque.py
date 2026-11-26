"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """雙向鏈結串列的節點"""

    def __init__(self, val: int):
        """初始化方法"""
        self.val: int = val
        self.next: ListNode | None = None  # 指向下一個節點的參照
        self.prev: ListNode | None = None  # 指向上一個節點的參照


class LinkedListDeque:
    """以雙向鏈結串列實作雙端佇列"""

    def __init__(self):
        """初始化方法"""
        self._front: ListNode | None = None  # _front 指向首節點
        self._rear: ListNode | None = None  # _rear 指向尾節點
        self._size: int = 0  # 雙端佇列長度

    def size(self) -> int:
        """取得雙端佇列長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷雙端佇列是否為空"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """加入元素"""
        node = ListNode(num)
        # 若鏈結串列為空，讓 _front 和 _rear 都指向 node
        if self.is_empty():
            self._front = self._rear = node
        # 從隊首加入元素
        elif is_front:
            # 將 node 加到鏈結串列的開頭
            self._front.prev = node
            node.next = self._front
            self._front = node  # 更新首節點
        # 從隊尾加入元素
        else:
            # 將 node 加到鏈結串列的末端
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 更新尾節點
        self._size += 1  # 將雙端佇列長度加 1

    def push_first(self, num: int):
        """從隊首加入元素"""
        self.push(num, True)

    def push_last(self, num: int):
        """從隊尾加入元素"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """取出元素"""
        if self.is_empty():
            raise IndexError("雙端佇列為空")
        # 佇列長度為 1 時，首尾兩端指向同一個節點
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # 從隊首取出元素
        elif is_front:
            val: int = self._front.val  # 暫存首節點的值
            # 移除首節點
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # 更新首節點
        # 從隊尾取出元素
        else:
            val: int = self._rear.val  # 暫存尾節點的值
            # 移除尾節點
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # 更新尾節點
        self._size -= 1  # 將雙端佇列長度減 1
        return val

    def pop_first(self) -> int:
        """從隊首取出元素"""
        return self.pop(True)

    def pop_last(self) -> int:
        """從隊尾取出元素"""
        return self.pop(False)

    def peek_first(self) -> int:
        """讀取隊首元素"""
        if self.is_empty():
            raise IndexError("雙端佇列為空")
        return self._front.val

    def peek_last(self) -> int:
        """讀取隊尾元素"""
        if self.is_empty():
            raise IndexError("雙端佇列為空")
        return self._rear.val

    def to_array(self) -> list[int]:
        """回傳串列以便輸出"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙端佇列
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("雙端佇列 deque =", deque.to_array())

    # 讀取隊首與隊尾元素
    peek_first: int = deque.peek_first()
    print("隊首元素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("隊尾元素 peek_last =", peek_last)

    # 將元素加入雙端佇列
    deque.push_last(4)
    print("將元素 4 加到隊尾後 deque =", deque.to_array())
    deque.push_first(1)
    print("將元素 1 加到隊首後 deque =", deque.to_array())

    # 從雙端佇列取出元素
    pop_last: int = deque.pop_last()
    print("從隊尾取出的元素 =", pop_last, "，從隊尾取出後 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("從隊首取出的元素 =", pop_first, "，從隊首取出後 deque =", deque.to_array())

    # 取得雙端佇列長度
    size: int = deque.size()
    print("雙端佇列長度 size =", size)

    # 判斷雙端佇列是否為空
    is_empty: bool = deque.is_empty()
    print("雙端佇列是否為空 =", is_empty)
