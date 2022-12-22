"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

from collections import deque


""" Driver Code """
if __name__ == "__main__":
    """ 初始化双向队列 """
    duque = deque()

    """ 元素入队 """
    duque.append(2)      # 添加至队尾
    duque.append(5)
    duque.append(4)
    duque.appendleft(3)  # 添加至队首
    duque.appendleft(1)
    print("双向队列 duque =", duque)

    """ 访问元素 """
    front = duque[0]  # 队首元素
    print("队首元素 front =", front)
    rear = duque[-1]  # 队尾元素
    print("队尾元素 rear =", rear)

    """ 元素出队 """
    pop_front = duque.popleft()  # 队首元素出队
    print("队首出队元素  pop_front =", pop_front)
    print("队首出队后 duque =", duque)
    pop_rear = duque.pop()       # 队尾元素出队
    print("队尾出队元素  pop_rear =", pop_rear)
    print("队尾出队后 duque =", duque)

    """ 获取双向队列的长度 """
    size = len(duque)
    print("双向队列长度 size =", size)

    """ 判断双向队列是否为空 """
    is_empty = len(duque) == 0
    print("双向队列是否为空 =", is_empty)
