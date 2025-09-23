"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # スタックを初期化
    # Pythonには組み込みのスタッククラスはありませんが、リストをスタックとして使用できます
    stack: list[int] = []

    # 要素をプッシュ
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("スタック stack =", stack)

    # スタックトップ要素にアクセス
    peek: int = stack[-1]
    print("スタックトップ要素 peek =", peek)

    # 要素をポップ
    pop: int = stack.pop()
    print("ポップされた要素 pop =", pop)
    print("ポップ後のスタック =", stack)

    # スタックの長さを取得
    size: int = len(stack)
    print("スタックの長さ size =", size)

    # 空かどうかを判定
    is_empty: bool = len(stack) == 0
    print("スタックが空かどうか =", is_empty)