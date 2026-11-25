"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """配列を使ったスタック"""

    def __init__(self):
        """初期化メソッド"""
        self._stack: list[int] = []

    def size(self) -> int:
        """スタックの要素数を取得する"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """スタックが空かどうかを判定する"""
        return self.size() == 0

    def push(self, item: int):
        """プッシュする"""
        self._stack.append(item)

    def pop(self) -> int:
        """ポップする"""
        if self.is_empty():
            raise IndexError("スタックが空です")
        return self._stack.pop()

    def peek(self) -> int:
        """スタックのトップを参照する"""
        if self.is_empty():
            raise IndexError("スタックが空です")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """表示用のリストを返す"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # スタックを初期化する
    stack = ArrayStack()

    # 要素をプッシュする
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("スタック stack =", stack.to_list())

    # スタックのトップを参照する
    peek: int = stack.peek()
    print("スタックのトップの要素 peek =", peek)

    # 要素をポップする
    pop: int = stack.pop()
    print("ポップした要素 pop =", pop)
    print("ポップ後の stack =", stack.to_list())

    # スタックの要素数を取得する
    size: int = stack.size()
    print("スタックの要素数 size =", size)

    # 空かどうかを判定する
    is_empty: bool = stack.is_empty()
    print("スタックは空か =", is_empty)
