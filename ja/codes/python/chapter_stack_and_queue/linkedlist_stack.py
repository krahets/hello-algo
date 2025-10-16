"""
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListStack:
    """連結リストベースのスタッククラス"""

    def __init__(self):
        """コンストラクタ"""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """スタックの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """スタックが空かどうかを判定"""
        return self._size == 0

    def push(self, val: int):
        """プッシュ"""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """ポップ"""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """スタックトップ要素にアクセス"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._peek.val

    def to_list(self) -> list[int]:
        """出力用のリストに変換"""
        arr = []
        node = self._peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


"""Driver Code"""
if __name__ == "__main__":
    # スタックを初期化
    stack = LinkedListStack()

    # 要素をプッシュ
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("スタック stack =", stack.to_list())

    # スタックトップ要素にアクセス
    peek: int = stack.peek()
    print("スタックトップ要素 peek =", peek)

    # 要素をポップ
    pop: int = stack.pop()
    print("ポップされた要素 pop =", pop)
    print("ポップ後のスタック =", stack.to_list())

    # スタックの長さを取得
    size: int = stack.size()
    print("スタックの長さ size =", size)

    # 空かどうかを判定
    is_empty: bool = stack.is_empty()
    print("スタックが空かどうか =", is_empty)