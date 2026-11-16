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
    # 初始化队列
    # 在 Python 中，我们一般将双向队列类 deque 当作队列使用
    # 虽然 queue.Queue() 是纯正的队列类，但不太好用，因此不推荐
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # 元素入队
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("队列 que =", que)

    # [region]{peek}
    # 访问队首元素
    front: int = que[0]
    # [endregion]{peek}
    print("队首元素 front =", front)

    # [region]{pop}
    # 元素出队
    pop: int = que.popleft()
    # [endregion]{pop}
    print("出队元素 pop =", pop)
    print("出队后 que =", que)

    # [region]{size}
    # 获取队列的长度
    size: int = len(que)
    # [endregion]{size}
    print("队列长度 size =", size)

    # [region]{is_empty}
    # 判断队列是否为空
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("队列是否为空 =", is_empty)
