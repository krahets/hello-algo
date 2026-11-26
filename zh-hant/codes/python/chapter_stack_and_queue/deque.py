"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化雙端佇列
    deq: deque[int] = deque()

    # 將元素加入雙端佇列
    deq.append(2)  # 加到隊尾
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 加到隊首
    deq.appendleft(1)
    print("雙端佇列 deque =", deq)

    # 讀取隊首與隊尾元素
    front: int = deq[0]  # 隊首元素
    print("隊首元素 front =", front)
    rear: int = deq[-1]  # 隊尾元素
    print("隊尾元素 rear =", rear)

    # 從雙端佇列取出元素
    pop_front: int = deq.popleft()  # 從隊首取出元素
    print("從隊首取出的元素  pop_front =", pop_front)
    print("從隊首取出後 deque =", deq)
    pop_rear: int = deq.pop()  # 從隊尾取出元素
    print("從隊尾取出的元素  pop_rear =", pop_rear)
    print("從隊尾取出後 deque =", deq)

    # 取得雙端佇列長度
    size: int = len(deq)
    print("雙端佇列長度 size =", size)

    # 判斷雙端佇列是否為空
    is_empty: bool = len(deq) == 0
    print("雙端佇列是否為空 =", is_empty)
