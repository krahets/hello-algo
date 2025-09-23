"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """円盤を移動"""
    # src の上から円盤を取り出す
    pan = src.pop()
    # 円盤を tar の上に置く
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """ハノイの塔問題 f(i) を解く"""
    # src に円盤が 1 つだけ残っている場合、それを tar に移動
    if i == 1:
        move(src, tar)
        return
    # 部分問題 f(i-1)：tar の助けを借りて src の上の i-1 個の円盤を buf に移動
    dfs(i - 1, src, tar, buf)
    # 部分問題 f(1)：残りの 1 個の円盤を src から tar に移動
    move(src, tar)
    # 部分問題 f(i-1)：src の助けを借りて buf の上の i-1 個の円盤を tar に移動
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """ハノイの塔問題を解く"""
    n = len(A)
    # B の助けを借りて A の上の n 個の円盤を C に移動
    dfs(n, A, B, C)


"""ドライバーコード"""
if __name__ == "__main__":
    # リストの末尾が柱の上部
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("初期状態：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("円盤移動後：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")