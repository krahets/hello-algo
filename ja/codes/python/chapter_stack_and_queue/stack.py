"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # スタックを初期化する
    # Python には組み込みのスタッククラスがないので、list をスタックとして使える
    stack: list[int] = []

    # 要素をプッシュする
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("スタック stack =", stack)

    # スタックのトップを参照する
    peek: int = stack[-1]
    print("スタックのトップの要素 peek =", peek)

    # 要素をポップする
    pop: int = stack.pop()
    print("ポップした要素 pop =", pop)
    print("ポップ後の stack =", stack)

    # スタックの要素数を取得する
    size: int = len(stack)
    print("スタックの要素数 size =", size)

    # 空かどうかを判定する
    is_empty: bool = len(stack) == 0
    print("スタックは空か =", is_empty)
