"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化
    # Pythonでは、一般的にdequeクラスをキューとして考えます
    # queue.Queue()は純粋なキュークラスですが、あまりユーザーフレンドリーではありません
    que: deque[int] = deque()

    # 要素をエンキュー
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("キュー que =", que)

    # フロント要素にアクセス
    front: int = que[0]
    print("フロント要素 front =", front)

    # 要素をデキュー
    pop: int = que.popleft()
    print("デキューされた要素 pop =", pop)
    print("デキュー後のキュー =", que)

    # キューの長さを取得
    size: int = len(que)
    print("キューの長さ size =", size)

    # キューが空かどうかを判定
    is_empty: bool = len(que) == 0
    print("キューが空かどうか =", is_empty)