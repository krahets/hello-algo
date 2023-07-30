"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """基于环形数组实现的队列"""

    def __init__(self, size: int):
        """构造方法"""
        self.__nums: list[int] = [0] * size  # 用于存储队列元素的数组
        self.__front: int = 0  # 队首指针，指向队首元素
        self.__size: int = 0  # 队列长度

    def capacity(self) -> int:
        """获取队列的容量"""
        return len(self.__nums)

    def size(self) -> int:
        """获取队列的长度"""
        return self.__size

    def is_empty(self) -> bool:
        """判断队列是否为空"""
        return self.__size == 0

    def push(self, num: int):
        """入队"""
        if self.__size == self.capacity():
            raise IndexError("队列已满")
        # 计算尾指针，指向队尾索引 + 1
        # 通过取余操作，实现 rear 越过数组尾部后回到头部
        rear: int = (self.__front + self.__size) % self.capacity()
        # 将 num 添加至队尾
        self.__nums[rear] = num
        self.__size += 1

    def pop(self) -> int:
        """出队"""
        num: int = self.peek()
        # 队首指针向后移动一位，若越过尾部则返回到数组头部
        self.__front = (self.__front + 1) % self.capacity()
        self.__size -= 1
        return num

    def peek(self) -> int:
        """访问队首元素"""
        if self.is_empty():
            raise IndexError("队列为空")
        return self.__nums[self.__front]

    def to_list(self) -> list[int]:
        """返回列表用于打印"""
        res = [0] * self.size()
        j: int = self.__front
        for i in range(self.size()):
            res[i] = self.__nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 初始化队列
    queue = ArrayQueue(10)

    # 元素入队
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    # 访问队首元素
    peek: int = queue.peek()
    print("队首元素 peek =", peek)

    # 元素出队
    pop: int = queue.pop()
    print("出队元素 pop =", pop)
    print("出队后 queue =", queue.to_list())

    # 获取队列的长度
    size: int = queue.size()
    print("队列长度 size =", size)

    # 判断队列是否为空
    is_empty: bool = queue.is_empty()
    print("队列是否为空 =", is_empty)

    # 测试环形数组
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "轮入队 + 出队后 queue = ", queue.to_list())
