"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""実行用コード"""
if __name__ == "__main__":
    # キューを初期化する
    # Python では一般に、両端キューのクラス deque をキューとして使う
    # queue.Queue() は専用のキュークラスだが、やや使いづらい
    que: deque[int] = deque()

    # 要素をエンキューする
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("キュー que =", que)

    # キューの先頭要素にアクセス
    front: int = que[0]
    print("キューの先頭要素 front =", front)

    # 要素をデキューする
    pop: int = que.popleft()
    print("デキューした要素 pop =", pop)
    print("デキュー後 que =", que)

    # キューの長さを取得
    size: int = len(que)
    print("キューの長さ size =", size)

    # キューが空か判定
    is_empty: bool = len(que) == 0
    print("キューは空か =", is_empty)
