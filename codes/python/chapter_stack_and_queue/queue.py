'''
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
'''

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

import queue

if __name__ == "__main__":
    """ 初始化队列 """
    queue = queue.Queue()

    """ 元素入队 """
    queue.put(1)
    queue.put(3)
    queue.put(2)
    queue.put(5)
    queue.put(4)
    print("队列 queue = ", queue.queue)

    """ 访问队首元素 """
    peek = queue.queue[0]
    print("队首元素 peek = ", peek)

    """ 元素出队 """
    get = queue.get()
    print("出队元素 get = ", get)
    print("出队后 queue = ", queue.queue)

    """ 获取队列的长度 """
    size = queue.qsize()
    print("队列长度 size = ", size)

    """ 判断队列是否为空 """
    is_empty = queue.empty()
    print("队列是否为空 = ", is_empty)
