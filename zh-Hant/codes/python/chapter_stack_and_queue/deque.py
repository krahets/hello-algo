"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙向佇列
    deq: deque[int] = deque()

    # 元素入列
    deq.append(2)  # 新增至佇列尾
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 新增至佇列首
    deq.appendleft(1)
    print("雙向佇列 deque =", deq)

    # 訪問元素
    front: int = deq[0]  # 佇列首元素
    print("佇列首元素 front =", front)
    rear: int = deq[-1]  # 佇列尾元素
    print("佇列尾元素 rear =", rear)

    # 元素出列
    pop_front: int = deq.popleft()  # 佇列首元素出列
    print("佇列首出列元素  pop_front =", pop_front)
    print("佇列首出列後 deque =", deq)
    pop_rear: int = deq.pop()  # 佇列尾元素出列
    print("佇列尾出列元素  pop_rear =", pop_rear)
    print("佇列尾出列後 deque =", deq)

    # 獲取雙向佇列的長度
    size: int = len(deq)
    print("雙向佇列長度 size =", size)

    # 判斷雙向佇列是否為空
    is_empty: bool = len(deq) == 0
    print("雙向佇列是否為空 =", is_empty)
