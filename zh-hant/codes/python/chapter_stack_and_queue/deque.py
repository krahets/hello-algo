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
    # 初始化雙向佇列
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # 元素入列
    deq.append(2)  # 新增至佇列尾
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 新增至佇列首
    deq.appendleft(1)
    # [endregion]{push}
    print("雙向佇列 deque =", deq)

    # [region]{peek_first}
    # 訪問元素
    front: int = deq[0]  # 佇列首元素
    # [endregion]{peek_first}
    print("佇列首元素 front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # 佇列尾元素
    # [endregion]{peek_last}
    print("佇列尾元素 rear =", rear)

    # [region]{pop_first}
    # 元素出列
    pop_front: int = deq.popleft()  # 佇列首元素出列
    # [endregion]{pop_first}
    print("佇列首出列元素  pop_front =", pop_front)
    print("佇列首出列後 deque =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # 佇列尾元素出列
    # [endregion]{pop_last}
    print("佇列尾出列元素  pop_rear =", pop_rear)
    print("佇列尾出列後 deque =", deq)

    # [region]{size}
    # 獲取雙向佇列的長度
    size: int = len(deq)
    # [endregion]{size}
    print("雙向佇列長度 size =", size)

    # [region]{is_empty}
    # 判斷雙向佇列是否為空
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("雙向佇列是否為空 =", is_empty)
