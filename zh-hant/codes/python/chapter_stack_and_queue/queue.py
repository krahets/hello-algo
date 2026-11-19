"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_queue}
    # 初始化佇列
    # 在 Python 中，我們一般將雙向佇列類別 deque 當作佇列使用
    # 雖然 queue.Queue() 是純正的佇列類別，但不太好用，因此不推薦
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # 元素入列
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("佇列 que =", que)

    # [region]{peek}
    # 訪問佇列首元素
    front: int = que[0]
    # [endregion]{peek}
    print("佇列首元素 front =", front)

    # [region]{pop}
    # 元素出列
    pop: int = que.popleft()
    # [endregion]{pop}
    print("出列元素 pop =", pop)
    print("出列後 que =", que)

    # [region]{size}
    # 獲取佇列的長度
    size: int = len(que)
    # [endregion]{size}
    print("佇列長度 size =", size)

    # [region]{is_empty}
    # 判斷佇列是否為空
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("佇列是否為空 =", is_empty)
