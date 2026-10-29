"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """再帰"""
    # 終了条件
    if n == 1:
        return 1
    # 往路：再帰呼び出し
    res = recur(n - 1)
    # 復路：結果を返す
    return n + res


def for_loop_recur(n: int) -> int:
    """反復を使って再帰を再現する"""
    # 明示的なスタックを使って、システムの呼び出しスタックを再現する
    stack = []
    res = 0
    # 往路：再帰呼び出し
    for i in range(n, 0, -1):
        # 「プッシュ操作」で再帰の「往路」を再現する
        stack.append(i)
    # 復路：結果を返す
    while stack:
        # 「ポップ操作」で再帰の「復路」を再現する
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """末尾再帰"""
    # 終了条件
    if n == 0:
        return res
    # 末尾再帰呼び出し
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """フィボナッチ数列：再帰"""
    # 終了条件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 再帰呼び出し f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # 結果 f(n) を返す
    return res


"""実行用コード"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\n再帰関数で求めた和 res = {res}")

    res = for_loop_recur(n)
    print(f"\n反復で再帰を再現して求めた和 res = {res}")

    res = tail_recur(n, 0)
    print(f"\n末尾再帰関数で求めた和 res = {res}")

    res = fib(n)
    print(f"\nフィボナッチ数列の第 {n} 項は {res}")
