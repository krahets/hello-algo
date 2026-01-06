"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListQueue:
    """連結リストベースのキュークラス"""

    def __init__(self):
        """コンストラクタ"""
        self._front: ListNode | None = None  # ヘッドノード front
        self._rear: ListNode | None = None  # テールノード rear
        self._size: int = 0

    def size(self) -> int:
        """キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """キューが空かどうかを判定"""
        return self._size == 0

    def push(self, num: int):
        """エンキュー"""
        # テールノードの後ろに num を追加
        node = ListNode(num)
        # キューが空の場合、ヘッドとテールノードの両方をそのノードに向ける
        if self._front is None:
            self._front = node
            self._rear = node
        # キューが空でない場合、そのノードをテールノードの後ろに追加
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """デキュー"""
        num = self.peek()
        # ヘッドノードを削除
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """フロント要素にアクセス"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._front.val

    def to_list(self) -> list[int]:
        """出力用のリストに変換"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化
    queue = LinkedListQueue()

    # 要素をエンキュー
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("キュー queue =", queue.to_list())

    # フロント要素にアクセス
    peek: int = queue.peek()
    print("フロント要素 front =", peek)

    # 要素をデキュー
    pop_front: int = queue.pop()
    print("デキューされた要素 pop =", pop_front)
    print("デキュー後のキュー =", queue.to_list())

    # キューの長さを取得
    size: int = queue.size()
    print("キューの長さ size =", size)

    # キューが空かどうかを判定
    is_empty: bool = queue.is_empty()
    print("キューが空かどうか =", is_empty)