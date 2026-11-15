"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""実行用コード"""
if __name__ == "__main__":
    # [region]{init_queue}
    # キューを初期化する
    # Python では一般に、両端キューのクラス deque をキューとして使う
    # queue.Queue() は専用のキュークラスだが、やや使いづらい
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # 要素をエンキューする
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("キュー que =", que)

    # [region]{peek}
    # キューの先頭要素にアクセス
    front: int = que[0]
    # [endregion]{peek}
    print("キューの先頭要素 front =", front)

    # [region]{pop}
    # 要素をデキューする
    pop: int = que.popleft()
    # [endregion]{pop}
    print("デキューした要素 pop =", pop)
    print("デキュー後 que =", que)

    # [region]{size}
    # キューの長さを取得
    size: int = len(que)
    # [endregion]{size}
    print("キューの長さ size =", size)

    # [region]{is_empty}
    # キューが空か判定
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("キューは空か =", is_empty)
