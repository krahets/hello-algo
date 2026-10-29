"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """円盤を 1 枚移動する"""
    # src の一番上から円盤を 1 枚取り出す
    pan = src.pop()
    # tar の一番上に円盤を置く
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """ハノイの塔の問題 f(i) を解く"""
    # src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
    if i == 1:
        move(src, tar)
        return
    # 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
    dfs(i - 1, src, tar, buf)
    # 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
    move(src, tar)
    # 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """ハノイの塔の問題を解く"""
    n = len(A)
    # A の上から n 枚の円盤を、B を使って C に移す
    dfs(n, A, B, C)


"""実行用コード"""
if __name__ == "__main__":
    # リストの末尾が棒の一番上に対応する
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("初期状態：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("円盤の移動完了後：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
