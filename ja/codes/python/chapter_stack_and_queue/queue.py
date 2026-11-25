"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化する
    # Python では一般に、両端キューのクラス deque をキューとして使う
    # queue.Queue() はキュー専用のクラスだが、使いづらい
    que: deque[int] = deque()

    # 要素をキューに追加する
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("キュー que =", que)

    # キューの先頭要素を参照する
    front: int = que[0]
    print("先頭要素 front =", front)

    # キューから要素を取り出す
    pop: int = que.popleft()
    print("デキューした要素 pop =", pop)
    print("デキュー後の que =", que)

    # キューの要素数を取得する
    size: int = len(que)
    print("キューの要素数 size =", size)

    # キューが空かどうかを判定する
    is_empty: bool = len(que) == 0
    print("キューは空か =", is_empty)
