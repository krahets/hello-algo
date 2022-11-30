'''
File: array_queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
'''

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于环形数组实现的队列 """
class ArrayQueue:
    def __init__(self, size):
        self.nums = [None] * size  # 用于存储队列元素的数组
        self.front = 0  # 头指针，指向队首
        self.rear = 0  # 尾指针，指向队尾 + 1

    """ 获取队列的容量 """
    def capacity(self):
        return len(self.nums)

    """ 获取队列的长度 """
    def size(self):
        # 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (self.capacity() + self.rear - self.front) % self.capacity()

    """ 判断队列是否为空 """
    def is_empty(self):
        return len(self.nums)==0

    """ 入队 """
    def put(self, val):
        if self.size() == self.capacity():
            print("队列已满")
            return False
        # 尾结点后添加 num
        self.nums[self.rear] = val
        # 尾指针向后移动一位，越过尾部后返回到数组头部
        self.rear = (self.rear + 1) % self.capacity()

    """ 出队 """
    def get(self):
        # 删除头结点
        if self.is_empty():
            print("队列为空")
            return False
        num = self.nums[self.front]
        self.nums[self.front] = None
        # 队头指针向后移动，越过尾部后返回到数组头部
        self.front = (self.front + 1) % self.capacity()
        return num

    """ 访问队首元素 """
    def peek(self):
        # 删除头结点
        if self.is_empty():
            return 1
        return self.nums[self.front]

    """ 访问指定位置元素 """
    def get_index(self, index):
        if index >= self.size():
            return -1
        return self.nums[(self.front + index) % self.capacity()]

if __name__ == "__main__":
    """ 初始化队列 """
    queue = ArrayQueue(5)

    """ 元素入队 """
    queue.put(1)
    queue.put(3)
    queue.put(2)
    queue.put(5)
    queue.put(4)
    print("队列 queue = ", queue.nums)

    """ 访问队首元素 """
    peek = queue.peek()
    print("队首元素 peek = ", peek)

    """ 元素出队 """
    get = queue.get()
    print("出队元素 get = ", get)
    print("出队后 queue = ", queue.nums)

    """ 获取队列的长度 """
    size = queue.size()
    print("队列长度 size = ", size)

    """ 判断队列是否为空 """
    is_empty = queue.is_empty()
    print("队列是否为空 = ", is_empty)
