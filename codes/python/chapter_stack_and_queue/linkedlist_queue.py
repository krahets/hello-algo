"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 基于链表实现的队列 """
class LinkedListQueue:
    def __init__(self):
        self.__front = None  # 头结点 front
        self.__rear = None   # 尾结点 rear
        self.__size = 0

    """ 获取队列的长度 """
    def size(self):
        return self.__size

    """ 判断队列是否为空 """
    def is_empty(self):
        return not self.__front

    """ 入队 """
    def push(self, num):
        # 尾结点后添加 num
        node = ListNode(num)
        # 如果队列为空，则令头、尾结点都指向该结点
        if self.__front == 0:
            self.__front = node
            self.__rear = node
        # 如果队列不为空，则将该结点添加到尾结点后
        else:
            self.__rear.next = node
            self.__rear = node
        self.__size += 1

    """ 出队 """
    def poll(self):
        num = self.peek()
        # 删除头结点
        self.__front = self.__front.next
        self.__size -= 1
        return num

    """ 访问队首元素 """
    def peek(self):
        if self.size() == 0:
            print("队列为空")
            return False
        return self.__front.val

    """ 转化为列表用于打印 """
    def to_list(self):
        queue = []
        temp = self.__front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


""" Driver Code """
if __name__ == "__main__":
    """ 初始化队列 """
    queue = LinkedListQueue()

    """ 元素入队 """
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("队列 queue =", queue.to_list())

    """ 访问队首元素 """
    peek = queue.peek()
    print("队首元素 front =", peek)

    """ 元素出队 """
    pop_front = queue.poll()
    print("出队元素 poll =", pop_front)
    print("出队后 queue =", queue.to_list())

    """ 获取队列的长度 """
    size = queue.size()
    print("队列长度 size =", size)

    """ 判断队列是否为空 """
    is_empty = queue.is_empty()
    print("队列是否为空 =", is_empty)
