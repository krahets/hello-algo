"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import os.path as osp
import sys

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


""" Driver Code """
if __name__ == "__main__":    
    """ 初始化队列 """
    # 在 Python 中，我们一般将双向队列类 deque 看左队列使用
    # 虽然 queue.Queue() 是纯正的队列类，但不太好用，因此不建议
    que = collections.deque()

    """ 元素入队 """
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("队列 que =", que)

    """ 访问队首元素 """
    front = que[0];
    print("队首元素 front =", front);

    """ 元素出队 """
    pop = que.popleft()
    print("出队元素 pop =", pop)
    print("出队后 que =", que)

    """ 获取队列的长度 """
    size = len(que)
    print("队列长度 size =", size)

    """ 判断队列是否为空 """
    is_empty = len(que) == 0
    print("队列是否为空 =", is_empty)
