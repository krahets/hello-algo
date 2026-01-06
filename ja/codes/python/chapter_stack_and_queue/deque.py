"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 双端キューを初期化
    deq: deque[int] = deque()

    # 要素をエンキュー
    deq.append(2)  # 後端に追加
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 前端に追加
    deq.appendleft(1)
    print("双端キュー deque =", deq)

    # 要素にアクセス
    front: int = deq[0]  # 前端要素
    print("前端要素 front =", front)
    rear: int = deq[-1]  # 後端要素
    print("後端要素 rear =", rear)

    # 要素をデキュー
    pop_front: int = deq.popleft()  # 前端要素のデキュー
    print("前端でデキューされた要素 pop_front =", pop_front)
    print("前端デキュー後のデック =", deq)
    pop_rear: int = deq.pop()  # 後端要素のデキュー
    print("後端でデキューされた要素 pop_rear =", pop_rear)
    print("後端デキュー後のデック =", deq)

    # 双端キューの長さを取得
    size: int = len(deq)
    print("双端キューの長さ size =", size)

    # 双端キューが空かどうかを判定
    is_empty: bool = len(deq) == 0
    print("双端キューが空かどうか =", is_empty)