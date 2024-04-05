"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """基於環形陣列實現的雙向佇列"""

    def __init__(self, capacity: int):
        """建構子"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """獲取雙向佇列的容量"""
        return len(self._nums)

    def size(self) -> int:
        """獲取雙向佇列的長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷雙向佇列是否為空"""
        return self._size == 0

    def index(self, i: int) -> int:
        """計算環形陣列索引"""
        # 透過取餘操作實現陣列首尾相連
        # 當 i 越過陣列尾部後，回到頭部
        # 當 i 越過陣列頭部後，回到尾部
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """佇列首入列"""
        if self._size == self.capacity():
            print("雙向佇列已滿")
            return
        # 佇列首指標向左移動一位
        # 透過取餘操作實現 front 越過陣列頭部後回到尾部
        self._front = self.index(self._front - 1)
        # 將 num 新增至佇列首
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """佇列尾入列"""
        if self._size == self.capacity():
            print("雙向佇列已滿")
            return
        # 計算佇列尾指標，指向佇列尾索引 + 1
        rear = self.index(self._front + self._size)
        # 將 num 新增至佇列尾
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """佇列首出列"""
        num = self.peek_first()
        # 佇列首指標向後移動一位
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """佇列尾出列"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """訪問佇列首元素"""
        if self.is_empty():
            raise IndexError("雙向佇列為空")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """訪問佇列尾元素"""
        if self.is_empty():
            raise IndexError("雙向佇列為空")
        # 計算尾元素索引
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """返回陣列用於列印"""
        # 僅轉換有效長度範圍內的串列元素
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙向佇列
    deque = ArrayDeque(10)
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
