"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


class LinkedListQueue:
    """基于链表实现的队列"""

    def __init__(self):
        """构造方法"""
        self.__front: ListNode | None = None  # 头节点 front
        self.__rear: ListNode | None = None  # 尾节点 rear
        self.__size: int = 0

    def size(self) -> int:
        """获取队列的长度"""
        return self.__size

    def is_empty(self) -> bool:
        """判断队列是否为空"""
        return not self.__front

    def push(self, num: int):
        """入队"""
        # 尾节点后添加 num
        node = ListNode(num)
        # 如果队列为空，则令头、尾节点都指向该节点
        if self.__front is None:
            self.__front = node
            self.__rear = node
        # 如果队列不为空，则将该节点添加到尾节点后
        else:
            self.__rear.next = node
            self.__rear = node
        self.__size += 1

    def pop(self) -> int:
        """出队"""
        num = self.peek()
        # 删除头节点
        self.__front = self.__front.next
        self.__size -= 1
        return num

    def peek(self) -> int:
        """访问队首元素"""
        if self.is_empty():
            raise IndexError("队列为空")
        return self.__front.val

    def to_list(self) -> list[int]:
        """转化为列表用于打印"""
        queue = []
        temp = self.__front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # 初始化队列
    queue = LinkedListQueue()

    # 元素入队
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    # 访问队首元素
    peek: int = queue.peek()
    print("队首元素 front =", peek)

    # 元素出队
    pop_front: int = queue.pop()
    print("出队元素 pop =", pop_front)
    print("出队后 queue =", queue.to_list())

    # 获取队列的长度
    size: int = queue.size()
    print("队列长度 size =", size)

    # 判断队列是否为空
    is_empty: bool = queue.is_empty()
    print("队列是否为空 =", is_empty)
