"""
File: array_deque.py
Created Time: 2023-03-01
Author: Krahets (krahets@163.com)
"""


class ArrayDeque:
    """基于环形数组实现的双向队列"""

    def __init__(self, capacity: int):
        """构造方法"""
        self.__nums: list[int] = [0] * capacity
        self.__front: int = 0
        self.__size: int = 0

    def capacity(self) -> int:
        """获取双向队列的容量"""
        return len(self.__nums)

    def size(self) -> int:
        """获取双向队列的长度"""
        return self.__size

    def is_empty(self) -> bool:
        """判断双向队列是否为空"""
        return self.__size == 0

    def index(self, i: int) -> int:
        """计算环形数组索引"""
        # 通过取余操作实现数组首尾相连
        # 当 i 越过数组尾部后，回到头部
        # 当 i 越过数组头部后，回到尾部
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """队首入队"""
        if self.__size == self.capacity():
            print("双向队列已满")
            return
        # 队首指针向左移动一位
        # 通过取余操作，实现 front 越过数组头部后回到尾部
        self.__front = self.index(self.__front - 1)
        # 将 num 添加至队首
        self.__nums[self.__front] = num
        self.__size += 1

    def push_last(self, num: int):
        """队尾入队"""
        if self.__size == self.capacity():
            print("双向队列已满")
            return
        # 计算尾指针，指向队尾索引 + 1
        rear = self.index(self.__front + self.__size)
        # 将 num 添加至队尾
        self.__nums[rear] = num
        self.__size += 1

    def pop_first(self) -> int:
        """队首出队"""
        num = self.peek_first()
        # 队首指针向后移动一位
        self.__front = self.index(self.__front + 1)
        self.__size -= 1
        return num

    def pop_last(self) -> int:
        """队尾出队"""
        num = self.peek_last()
        self.__size -= 1
        return num

    def peek_first(self) -> int:
        """访问队首元素"""
        if self.is_empty():
            raise IndexError("双向队列为空")
        return self.__nums[self.__front]

    def peek_last(self) -> int:
        """访问队尾元素"""
        if self.is_empty():
            raise IndexError("双向队列为空")
        # 计算尾元素索引
        last = self.index(self.__front + self.__size - 1)
        return self.__nums[last]

    def to_array(self) -> list[int]:
        """返回数组用于打印"""
        # 仅转换有效长度范围内的列表元素
        res = []
        for i in range(self.__size):
            res.append(self.__nums[self.index(self.__front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化双向队列
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("双向队列 deque =", deque.to_array())

    # 访问元素
    peek_first: int = deque.peek_first()
    print("队首元素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("队尾元素 peek_last =", peek_last)

    # 元素入队
    deque.push_last(4)
    print("元素 4 队尾入队后 deque =", deque.to_array())
    deque.push_first(1)
    print("元素 1 队首入队后 deque =", deque.to_array())

    # 元素出队
    pop_last: int = deque.pop_last()
    print("队尾出队元素 =", pop_last, "，队尾出队后 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("队首出队元素 =", pop_first, "，队首出队后 deque =", deque.to_array())

    # 获取双向队列的长度
    size: int = deque.size()
    print("双向队列长度 size =", size)

    # 判断双向队列是否为空
    is_empty: bool = deque.is_empty()
    print("双向队列是否为空 =", is_empty)
