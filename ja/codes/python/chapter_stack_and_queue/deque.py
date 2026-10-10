"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 両端キューを初期化
    deq: deque[int] = deque()

    # 要素をエンキュー
    deq.append(2)  # 末尾に追加する
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 先頭に追加する
    deq.appendleft(1)
    print("両端キュー deque =", deq)

    # 要素にアクセス
    front: int = deq[0]  # 先頭要素
    print("先頭要素 front =", front)
    rear: int = deq[-1]  # 末尾要素
    print("末尾要素 rear =", rear)

    # 要素をデキュー
    pop_front: int = deq.popleft()  # 先頭要素を取り出す
    print("先頭から取り出した要素  pop_front =", pop_front)
    print("先頭から取り出した後 deque =", deq)
    pop_rear: int = deq.pop()  # 末尾要素を取り出す
    print("末尾から取り出した要素  pop_rear =", pop_rear)
    print("末尾から取り出した後 deque =", deq)

    # 両端キューの長さを取得
    size: int = len(deq)
    print("両端キューの長さ size =", size)

    # 両端キューが空かどうかを判定
    is_empty: bool = len(deq) == 0
    print("両端キューが空かどうか =", is_empty)
