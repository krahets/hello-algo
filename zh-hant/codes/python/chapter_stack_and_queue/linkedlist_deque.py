"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """雙向鏈結串列節點"""

    def __init__(self, val: int):
        """建構子"""
        self.val: int = val
        self.next: ListNode | None = None  # 後繼節點引用
        self.prev: ListNode | None = None  # 前驅節點引用


class LinkedListDeque:
    """基於雙向鏈結串列實現的雙向佇列"""

    def __init__(self):
        """建構子"""
        self._front: ListNode | None = None  # 頭節點 front
        self._rear: ListNode | None = None  # 尾節點 rear
        self._size: int = 0  # 雙向佇列的長度

    def size(self) -> int:
        """獲取雙向佇列的長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷雙向佇列是否為空"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """入列操作"""
        node = ListNode(num)
        # 若鏈結串列為空，則令 front 和 rear 都指向 node
        if self.is_empty():
            self._front = self._rear = node
        # 佇列首入列操作
        elif is_front:
            # 將 node 新增至鏈結串列頭部
            self._front.prev = node
            node.next = self._front
            self._front = node  # 更新頭節點
        # 佇列尾入列操作
        else:
            # 將 node 新增至鏈結串列尾部
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 更新尾節點
        self._size += 1  # 更新佇列長度

    def push_first(self, num: int):
        """佇列首入列"""
        self.push(num, True)

    def push_last(self, num: int):
        """佇列尾入列"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """出列操作"""
        if self.is_empty():
            raise IndexError("雙向佇列為空")
        # 佇列首出列操作
        if is_front:
            val: int = self._front.val  # 暫存頭節點值
            # 刪除頭節點
            fnext: ListNode | None = self._front.next
            if fnext != None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # 更新頭節點
        # 佇列尾出列操作
        else:
            val: int = self._rear.val  # 暫存尾節點值
            # 刪除尾節點
            rprev: ListNode | None = self._rear.prev
            if rprev != None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # 更新尾節點
        self._size -= 1  # 更新佇列長度
        return val

    def pop_first(self) -> int:
        """佇列首出列"""
        return self.pop(True)

    def pop_last(self) -> int:
        """佇列尾出列"""
        return self.pop(False)

    def peek_first(self) -> int:
        """訪問佇列首元素"""
        if self.is_empty():
            raise IndexError("雙向佇列為空")
        return self._front.val

    def peek_last(self) -> int:
        """訪問佇列尾元素"""
        if self.is_empty():
            raise IndexError("雙向佇列為空")
        return self._rear.val

    def to_array(self) -> list[int]:
        """返回陣列用於列印"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙向佇列
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("雙向佇列 deque =", deque.to_array())

    # 訪問元素
    peek_first: int = deque.peek_first()
    print("佇列首元素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("佇列尾元素 peek_last =", peek_last)

    # 元素入列
    deque.push_last(4)
    print("元素 4 佇列尾入列後 deque =", deque.to_array())
    deque.push_first(1)
    print("元素 1 佇列首入列後 deque =", deque.to_array())

    # 元素出列
    pop_last: int = deque.pop_last()
    print("佇列尾出列元素 =", pop_last, "，佇列尾出列後 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("佇列首出列元素 =", pop_first, "，佇列首出列後 deque =", deque.to_array())

    # 獲取雙向佇列的長度
    size: int = deque.size()
    print("雙向佇列長度 size =", size)

    # 判斷雙向佇列是否為空
    is_empty: bool = deque.is_empty()
    print("雙向佇列是否為空 =", is_empty)
