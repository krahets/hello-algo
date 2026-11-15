"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""実行用コード"""
if __name__ == "__main__":
    # [region]{init_deque}
    # 両端キューを初期化する
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # 要素をエンキューする
    deq.append(2)  # キューの末尾に追加する
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # キューの先頭に追加する
    deq.appendleft(1)
    # [endregion]{push}
    print("両端キュー deque =", deq)

    # [region]{peek_first}
    # 要素にアクセスする
    front: int = deq[0]  # キューの先頭要素
    # [endregion]{peek_first}
    print("キューの先頭要素 front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # キューの末尾要素
    # [endregion]{peek_last}
    print("キューの末尾要素 rear =", rear)

    # [region]{pop_first}
    # 要素をデキューする
    pop_front: int = deq.popleft()  # キューの先頭要素をデキューする
    # [endregion]{pop_first}
    print("先頭からデキューした要素  pop_front =", pop_front)
    print("先頭からデキューした後 deque =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # キューの末尾要素をデキューする
    # [endregion]{pop_last}
    print("末尾からデキューした要素  pop_rear =", pop_rear)
    print("末尾からデキューした後 deque =", deq)

    # [region]{size}
    # 両端キューの長さを取得する
    size: int = len(deq)
    # [endregion]{size}
    print("両端キューの長さ size =", size)

    # [region]{is_empty}
    # 両端キューが空かどうかを判定する
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("両端キューは空か =", is_empty)
