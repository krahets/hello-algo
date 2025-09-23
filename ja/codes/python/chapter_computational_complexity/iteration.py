"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """forループ"""
    res = 0
    # 1, 2, ..., n-1, n の合計をループ
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """whileループ"""
    res = 0
    i = 1  # 条件変数を初期化
    # 1, 2, ..., n-1, n の合計をループ
    while i <= n:
        res += i
        i += 1  # 条件変数を更新
    return res


def while_loop_ii(n: int) -> int:
    """whileループ（2つの更新）"""
    res = 0
    i = 1  # 条件変数を初期化
    # 1, 4, 10, ... の合計をループ
    while i <= n:
        res += i
        # 条件変数を更新
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """二重forループ"""
    res = ""
    # i = 1, 2, ..., n-1, n をループ
    for i in range(1, n + 1):
        # j = 1, 2, ..., n-1, n をループ
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nforループの合計結果 res = {res}")

    res = while_loop(n)
    print(f"\nwhileループの合計結果 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhileループ（2つの更新）の合計結果 res = {res}")

    res = nested_for_loop(n)
    print(f"\n二重forループの走査結果 {res}")