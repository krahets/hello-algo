"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for ループ"""
    res = 0
    # 1, 2, ..., n-1, n を順に加算する
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while ループ"""
    res = 0
    i = 1  # 条件変数を初期化する
    # 1, 2, ..., n-1, n を順に加算する
    while i <= n:
        res += i
        i += 1  # 条件変数を更新する
    return res


def while_loop_ii(n: int) -> int:
    """while ループ（2回更新）"""
    res = 0
    i = 1  # 条件変数を初期化する
    # 1, 4, 10, ... を順に加算する
    while i <= n:
        res += i
        # 条件変数を更新する
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """二重 for ループ"""
    res = ""
    # i = 1, 2, ..., n-1, n とループする
    for i in range(1, n + 1):
        # j = 1, 2, ..., n-1, n とループする
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor ループの合計結果 res = {res}")

    res = while_loop(n)
    print(f"\nwhile ループの合計結果 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile ループ（2 回更新）の合計結果 res = {res}")

    res = nested_for_loop(n)
    print(f"\n二重 for ループの走査結果 {res}")
