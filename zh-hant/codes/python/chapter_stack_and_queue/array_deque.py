"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """以環狀陣列實作雙端佇列"""

    def __init__(self, capacity: int):
        """初始化方法"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """取得雙端佇列容量"""
        return len(self._nums)

    def size(self) -> int:
        """取得雙端佇列長度"""
        return self._size

    def is_empty(self) -> bool:
        """判斷雙端佇列是否為空"""
        return self._size == 0

    def index(self, i: int) -> int:
        """計算環狀陣列的索引"""
        # 取餘數，讓陣列的首尾相接
        # 當 i 超過陣列末端時，繞回開頭
        # 當 i 越過陣列開頭時，繞回末端
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """從隊首加入元素"""
        if self._size == self.capacity():
            print("雙端佇列已滿")
            return
        # 將隊首索引往左移一格
        # 取餘數，讓 _front 越過陣列開頭時繞回末端
        self._front = self.index(self._front - 1)
        # 將 num 加到隊首
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """從隊尾加入元素"""
        if self._size == self.capacity():
            print("雙端佇列已滿")
            return
        # 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        rear = self.index(self._front + self._size)
        # 將 num 加到隊尾
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """從隊首取出元素"""
        num = self.peek_first()
        # 將隊首索引往後移一格
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """從隊尾取出元素"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """讀取隊首元素"""
        if self.is_empty():
            raise IndexError("雙端佇列為空")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """讀取隊尾元素"""
        if self.is_empty():
            raise IndexError("雙端佇列為空")
        # 計算隊尾元素的索引
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """回傳串列以便輸出"""
        # 只轉換雙端佇列中實際存放的元素
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙端佇列
    deque = ArrayDeque(10)
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
