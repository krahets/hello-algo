"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *


""" Driver Code """
if __name__ == "__main__":
    """ 初始化双向队列 """
    deque: Deque[int] = collections.deque()

    """ 元素入队 """
    deque.append(2)      # 添加至队尾
    deque.append(5)
    deque.append(4)
    deque.appendleft(3)  # 添加至队首
    deque.appendleft(1)
    print("双向队列 deque =", deque)

    """ 访问元素 """
    front: int = deque[0]  # 队首元素
    print("队首元素 front =", front)
    rear: int = deque[-1]  # 队尾元素
    print("队尾元素 rear =", rear)

    """ 元素出队 """
    pop_front: int = deque.popleft()  # 队首元素出队
    print("队首出队元素  pop_front =", pop_front)
    print("队首出队后 deque =", deque)
    pop_rear: int = deque.pop()       # 队尾元素出队
    print("队尾出队元素  pop_rear =", pop_rear)
    print("队尾出队后 deque =", deque)

    """ 获取双向队列的长度 """
    size: int = len(deque)
    print("双向队列长度 size =", size)

    """ 判断双向队列是否为空 """
    is_empty: bool = len(deque) == 0
    print("双向队列是否为空 =", is_empty)
