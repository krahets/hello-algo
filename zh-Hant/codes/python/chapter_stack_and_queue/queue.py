"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 初始化佇列
    # 在 Python 中，我們一般將雙向佇列類別 deque 看作佇列使用
    # 雖然 queue.Queue() 是純正的佇列類別，但不太好用
    que: deque[int] = deque()

    # 元素入列
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("佇列 que =", que)

    # 訪問佇列首元素
    front: int = que[0]
    print("佇列首元素 front =", front)

    # 元素出列
    pop: int = que.popleft()
    print("出列元素 pop =", pop)
    print("出列後 que =", que)

    # 獲取佇列的長度
    size: int = len(que)
    print("佇列長度 size =", size)

    # 判斷佇列是否為空
    is_empty: bool = len(que) == 0
    print("佇列是否為空 =", is_empty)
