"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """配列ベースのスタッククラス"""

    def __init__(self):
        """コンストラクタ"""
        self._stack: list[int] = []

    def size(self) -> int:
        """スタックの長さを取得"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """スタックが空かどうかを判定"""
        return self.size() == 0

    def push(self, item: int):
        """プッシュ"""
        self._stack.append(item)

    def pop(self) -> int:
        """ポップ"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack.pop()

    def peek(self) -> int:
        """スタックトップ要素にアクセス"""
        if self.is_empty():
            raise IndexError("Stack is empty")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """出力用の配列を返す"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # スタックを初期化
    stack = ArrayStack()

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