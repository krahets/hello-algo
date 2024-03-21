"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化双向队列
    deq: deque[int] = deque()

    # 元素入队
    deq.append(2)  # 添加至队尾
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 添加至队首
    deq.appendleft(1)
    print("双向队列 deque =", deq)

    # 访问元素
    front: int = deq[0]  # 队首元素
    print("队首元素 front =", front)
    rear: int = deq[-1]  # 队尾元素
    print("队尾元素 rear =", rear)

    # 元素出队
    pop_front: int = deq.popleft()  # 队首元素出队
    print("队首出队元素  pop_front =", pop_front)
    print("队首出队后 deque =", deq)
    pop_rear: int = deq.pop()  # 队尾元素出队
    print("队尾出队元素  pop_rear =", pop_rear)
    print("队尾出队后 deque =", deq)

    # 获取双向队列的长度
    size: int = len(deq)
    print("双向队列长度 size =", size)

    # 判断双向队列是否为空
    is_empty: bool = len(deq) == 0
    print("双向队列是否为空 =", is_empty)
