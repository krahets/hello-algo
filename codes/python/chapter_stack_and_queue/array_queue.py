"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于环形数组实现的队列 """
class ArrayQueue:
    def __init__(self, size):
        self.__nums = [0] * size  # 用于存储队列元素的数组
        self.__front = 0             # 头指针，指向队首
        self.__rear = 0              # 尾指针，指向队尾 + 1

    """ 获取队列的容量 """
    def capacity(self):
        return len(self.__nums)

    """ 获取队列的长度 """
    def size(self):
        # 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (self.capacity() + self.__rear - self.__front) % self.capacity()

    """ 判断队列是否为空 """
    def is_empty(self):
        return (self.__rear - self.__front) == 0

    """ 入队 """
    def push(self, val):
        if self.size() == self.capacity():
            print("队列已满")
            return False
        # 尾结点后添加 num
        self.__nums[self.__rear] = val
        # 尾指针向后移动一位，越过尾部后返回到数组头部
        self.__rear = (self.__rear + 1) % self.capacity()

    """ 出队 """
    def poll(self):
        num = self.peek()
        # 队头指针向后移动一位，若越过尾部则返回到数组头部
        self.__front = (self.__front + 1) % self.capacity()
        return num

    """ 访问队首元素 """
    def peek(self):
        if self.is_empty():
            print("队列为空")
            return False
        return self.__nums[self.__front]

    """ 返回列表用于打印 """
    def to_list(self):
        res = [0] * self.size()
        j = self.__front
        for i in range(self.size()):
            res[i] = self.__nums[(j % self.capacity())]
            j += 1
        return res


""" Driver Code """
if __name__ == "__main__":
    """ 初始化队列 """
    queue = ArrayQueue(10)

    """ 元素入队 """
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    """ 访问队首元素 """
    peek = queue.peek()
    print("队首元素 peek =", peek)

    """ 元素出队 """
    poll = queue.poll()
    print("出队元素 poll =", poll)
    print("出队后 queue =", queue.to_list())

    """ 获取队列的长度 """
    size = queue.size()
    print("队列长度 size =", size)

    """ 判断队列是否为空 """
    is_empty = queue.is_empty()
    print("队列是否为空 =", is_empty)
