"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""実行用コード"""
if __name__ == "__main__":
    # [region]{init_stack}
    # スタックを初期化する
    # Python には組み込みのスタッククラスがないため、list をスタックとして使える
    stack: list[int] = []
    # [endregion]{init_stack}

    # [region]{push}
    # 要素をプッシュする
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    # [endregion]{push}
    print("スタック stack =", stack)

    # [region]{peek}
    # スタックの先頭要素にアクセスする
    peek: int = stack[-1]
    # [endregion]{peek}
    print("スタックの先頭要素 peek =", peek)

    # [region]{pop}
    # 要素をポップする
    pop: int = stack.pop()
    # [endregion]{pop}
    print("ポップした要素 pop =", pop)
    print("ポップ後 stack =", stack)

    # [region]{size}
    # スタックの長さを取得する
    size: int = len(stack)
    # [endregion]{size}
    print("スタックの長さ size =", size)

    # [region]{is_empty}
    # 空かどうかを判定する
    is_empty: bool = len(stack) == 0
    # [endregion]{is_empty}
    print("スタックは空か =", is_empty)
