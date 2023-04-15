"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化队列
    # 在 Python 中，我们一般将双向队列类 deque 看作队列使用
    # 虽然 queue.Queue() 是纯正的队列类，但不太好用
    que: deque[int] = deque()

    # 元素入队
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("队列 que =", que)

    # 访问队首元素
    front: int = que[0]
    print("队首元素 front =", front)

    # 元素出队
    pop: int = que.popleft()
    print("出队元素 pop =", pop)
    print("出队后 que =", que)

    # 获取队列的长度
    size: int = len(que)
    print("队列长度 size =", size)

    # 判断队列是否为空
    is_empty: bool = len(que) == 0
    print("队列是否为空 =", is_empty)
