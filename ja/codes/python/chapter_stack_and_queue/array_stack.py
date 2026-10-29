"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """配列で実装したスタック"""

    def __init__(self):
        """コンストラクタ"""
        self._stack: list[int] = []

    def size(self) -> int:
        """スタックの長さを取得する"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """スタックが空かどうかを判定する"""
        return self.size() == 0

    def push(self, item: int):
        """プッシュ"""
        self._stack.append(item)

    def pop(self) -> int:
        """ポップ"""
        if self.is_empty():
            raise IndexError("スタックが空です")
        return self._stack.pop()

    def peek(self) -> int:
        """スタックの先頭要素にアクセスする"""
        if self.is_empty():
            raise IndexError("スタックが空です")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """表示用のリストを返す"""
        return self._stack


"""実行用コード"""
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

    # スタックの先頭要素にアクセスする
    peek: int = stack.peek()
    print("スタックの先頭要素 peek =", peek)

    # 要素をポップする
    pop: int = stack.pop()
    print("ポップした要素 pop =", pop)
    print("ポップ後 stack =", stack.to_list())

    # スタックの長さを取得する
    size: int = stack.size()
    print("スタックの長さ size =", size)

    # 空かどうかを判定する
    is_empty: bool = stack.is_empty()
    print("スタックは空か =", is_empty)
