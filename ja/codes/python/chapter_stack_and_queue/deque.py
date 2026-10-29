"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""実行用コード"""
if __name__ == "__main__":
    # 両端キューを初期化する
    deq: deque[int] = deque()

    # 要素をエンキューする
    deq.append(2)  # キューの末尾に追加する
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # キューの先頭に追加する
    deq.appendleft(1)
    print("両端キュー deque =", deq)

    # 要素にアクセスする
    front: int = deq[0]  # キューの先頭要素
    print("キューの先頭要素 front =", front)
    rear: int = deq[-1]  # キューの末尾要素
    print("キューの末尾要素 rear =", rear)

    # 要素をデキューする
    pop_front: int = deq.popleft()  # キューの先頭要素をデキューする
    print("先頭からデキューした要素  pop_front =", pop_front)
    print("先頭からデキューした後 deque =", deq)
    pop_rear: int = deq.pop()  # キューの末尾要素をデキューする
    print("末尾からデキューした要素  pop_rear =", pop_rear)
    print("末尾からデキューした後 deque =", deq)

    # 両端キューの長さを取得する
    size: int = len(deq)
    print("両端キューの長さ size =", size)

    # 両端キューが空かどうかを判定する
    is_empty: bool = len(deq) == 0
    print("両端キューは空か =", is_empty)
