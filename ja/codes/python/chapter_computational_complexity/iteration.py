"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for ループ"""
    res = 0
    # 1, 2, ..., n-1, n の和をループで求める
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while ループ"""
    res = 0
    i = 1  # 条件判定用の変数を初期化
    # 1, 2, ..., n-1, n の和をループで求める
    while i <= n:
        res += i
        i += 1  # 条件判定用の変数を更新
    return res


def while_loop_ii(n: int) -> int:
    """while ループ（2 回更新）"""
    res = 0
    i = 1  # 条件判定用の変数を初期化
    # 1, 4, 10, ... の和をループで求める
    while i <= n:
        res += i
        # 条件判定用の変数を更新
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """二重の for ループ"""
    res = ""
    # i = 1, 2, ..., n-1, n の順に繰り返す
    for i in range(1, n + 1):
        # j = 1, 2, ..., n-1, n の順に繰り返す
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor ループによる総和 res = {res}")

    res = while_loop(n)
    print(f"\nwhile ループによる総和 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile ループ（2 回更新）による総和 res = {res}")

    res = nested_for_loop(n)
    print(f"\n二重の for ループの走査結果 {res}")
