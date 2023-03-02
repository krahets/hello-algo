"""
File: array_deque.py
Created Time: 2023-03-01
Author: Krahets (krahets@163.com)
"""

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

class ArrayDeque:
    """ 基于环形数组实现的双向队列 """
    def __init__(self, capacity):
        """  构造方法 """
        self.nums = [0] * capacity
        self.front = 0
        self.que_size = 0

    def capacity(self):
        """ 获取双向队列的容量 """
        return len(self.nums)

    def size(self):
        """ 获取双向队列的长度 """
        return self.que_size

    def is_empty(self):
        """ 判断双向队列是否为空 """
        return self.que_size == 0

    def index(self, i):
        """ 计算环形数组索引 """
        # 通过取余操作实现数组首尾相连
        # 当 i 越过数组尾部后，回到头部
        # 当 i 越过数组头部后，回到尾部
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num):
        """ 队首入队 """
        if self.que_size == self.capacity():
            print("双向队列已满")
            return
        # 队首指针向左移动一位
        # 通过取余操作，实现 front 越过数组头部后回到尾部
        self.front = self.index(self.front-1)
        # 将 num 添加至队首
        self.nums[self.front] = num
        self.que_size += 1

    def push_last(self, num):
        """ 队尾入队 """
        if self.que_size == self.capacity():
            print("双向队列已满")
            return
        # 计算尾指针，指向队尾索引 + 1
        rear = self.index(self.front + self.que_size)
        # 将 num 添加至队尾
        self.nums[rear] = num
        self.que_size += 1

    def poll_first(self):
        """ 队首出队 """
        num = self.peek_first()
        # 队首指针向后移动一位
        self.front = self.index(self.front+1)
        self.que_size -= 1
        return num

    def poll_last(self):
        """ 队尾出队 """
        num = self.peek_last()
        self.que_size -= 1
        return num

    def peek_first(self):
        """ 访问队首元素 """
        assert not self.is_empty(), "双向队列为空"
        return self.nums[self.front]

    def peek_last(self):
        """ 访问队尾元素 """
        assert not self.is_empty(), "双向队列为空"
        # 计算尾元素索引
        last = self.index(self.front + self.que_size - 1)
        return self.nums[last]

    def to_array(self):
        """ 返回数组用于打印 """
        # 仅转换有效长度范围内的列表元素
        res = []
        for i in range(self.que_size):
            res.append(self.nums[self.index(self.front+i)])
        return res


""" Driver Code """
if __name__ == "__main__":
    """ 初始化双向队列 """
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("双向队列 deque =", deque.to_array())

    """ 访问元素 """
    peek_first = deque.peek_first()
    print("队首元素 peek_first =", peek_first)
    peek_last = deque.peek_last()
    print("队尾元素 peek_last =", peek_last)

    """ 元素入队 """
    deque.push_last(4)
    print("元素 4 队尾入队后 deque =", deque.to_array())
    deque.push_first(1)
    print("元素 1 队首入队后 deque =", deque.to_array())

    """ 元素出队 """
    poll_last = deque.poll_last()
    print("队尾出队元素 =", poll_last, "，队尾出队后 deque =", deque.to_array())
    poll_first = deque.poll_first()
    print("队首出队元素 =", poll_first, "，队首出队后 deque =", deque.to_array())

    """ 获取双向队列的长度 """
    size = deque.size()
    print("双向队列长度 size =", size)

    """ 判断双向队列是否为空 """
    is_empty = deque.is_empty()
    print("双向队列是否为空 =", is_empty)
