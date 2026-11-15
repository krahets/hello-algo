"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_deque}
    # 初始化双向队列
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # 元素入队
    deq.append(2)  # 添加至队尾
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 添加至队首
    deq.appendleft(1)
    # [endregion]{push}
    print("双向队列 deque =", deq)

    # [region]{peek_first}
    # 访问元素
    front: int = deq[0]  # 队首元素
    # [endregion]{peek_first}
    print("队首元素 front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # 队尾元素
    # [endregion]{peek_last}
    print("队尾元素 rear =", rear)

    # [region]{pop_first}
    # 元素出队
    pop_front: int = deq.popleft()  # 队首元素出队
    # [endregion]{pop_first}
    print("队首出队元素  pop_front =", pop_front)
    print("队首出队后 deque =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # 队尾元素出队
    # [endregion]{pop_last}
    print("队尾出队元素  pop_rear =", pop_rear)
    print("队尾出队后 deque =", deq)

    # [region]{size}
    # 获取双向队列的长度
    size: int = len(deq)
    # [endregion]{size}
    print("双向队列长度 size =", size)

    # [region]{is_empty}
    # 判断双向队列是否为空
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("双向队列是否为空 =", is_empty)
