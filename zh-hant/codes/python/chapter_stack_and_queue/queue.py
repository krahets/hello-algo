"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化佇列
    # 在 Python 中，通常用雙端佇列類別 deque 當作一般佇列
    # 雖然 queue.Queue() 能建立專用佇列類別的實例，但用起來較不方便
    que: deque[int] = deque()

    # 將元素加入佇列
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("佇列 que =", que)

    # 讀取隊首元素
    front: int = que[0]
    print("隊首元素 front =", front)

    # 從佇列取出元素
    pop: int = que.popleft()
    print("出隊元素 pop =", pop)
    print("出隊後 que =", que)

    # 取得佇列長度
    size: int = len(que)
    print("佇列長度 size =", size)

    # 判斷佇列是否為空
    is_empty: bool = len(que) == 0
    print("佇列是否為空 =", is_empty)
