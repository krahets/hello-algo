"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """移動一個圓盤"""
    # 從 src 頂端取出一個圓盤
    pan = src.pop()
    # 將圓盤放到 tar 頂端
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """求解河內塔問題 f(i)"""
    # 若 src 只剩一個圓盤，直接將它移到 tar
    if i == 1:
        move(src, tar)
        return
    # 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
    dfs(i - 1, src, tar, buf)
    # 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
    move(src, tar)
    # 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """求解河內塔問題"""
    n = len(A)
    # 藉助 B，將 A 頂端的 n 個圓盤移到 C
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # 串列尾端對應柱子頂端
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("初始狀態：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("圓盤移動完成後：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
