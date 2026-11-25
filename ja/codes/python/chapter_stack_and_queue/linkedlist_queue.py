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
    """連結リストを使ったキュー"""

    def __init__(self):
        """初期化メソッド"""
        self._front: ListNode | None = None  # 先頭ノード front
        self._rear: ListNode | None = None  # 末尾ノード rear
        self._size: int = 0

    def size(self) -> int:
        """キューの要素数を取得する"""
        return self._size

    def is_empty(self) -> bool:
        """キューが空かどうかを判定する"""
        return self._size == 0

    def push(self, num: int):
        """エンキューする"""
        # 値が num のノードを末尾ノードの後ろに追加する
        node = ListNode(num)
        # キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if self._front is None:
            self._front = node
            self._rear = node
        # キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """デキューする"""
        num = self.peek()
        # 先頭ノードを削除する
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """キューの先頭要素を参照する"""
        if self.is_empty():
            raise IndexError("キューが空です")
        return self._front.val

    def to_list(self) -> list[int]:
        """表示用のリストに変換する"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化する
    queue = LinkedListQueue()

    # 要素をキューに追加する
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("キュー queue =", queue.to_list())

    # キューの先頭要素を参照する
    peek: int = queue.peek()
    print("先頭要素 front =", peek)

    # キューから要素を取り出す
    pop_front: int = queue.pop()
    print("デキューした要素 pop =", pop_front)
    print("デキュー後の queue =", queue.to_list())

    # キューの要素数を取得する
    size: int = queue.size()
    print("キューの要素数 size =", size)

    # キューが空かどうかを判定する
    is_empty: bool = queue.is_empty()
    print("キューは空か =", is_empty)
