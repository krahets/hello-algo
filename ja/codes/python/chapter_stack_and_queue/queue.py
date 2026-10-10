"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化する
    # Python では通常、両端キュー deque をキューとして使う
    # queue.Queue() は正統なキュークラスだが、あまり使いやすくない
    que: deque[int] = deque()

    # 要素をエンキュー
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("キュー que =", que)

    # キュー先頭の要素にアクセス
    front: int = que[0]
    print("先頭要素 front =", front)

    # 要素をデキュー
    pop: int = que.popleft()
    print("取り出した要素 pop =", pop)
    print("取り出し後 que =", que)

    # キューの長さを取得
    size: int = len(que)
    print("キューの長さ size =", size)

    # キューが空かどうかを判定
    is_empty: bool = len(que) == 0
    print("キューが空かどうか =", is_empty)
