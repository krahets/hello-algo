"""
File: hanota.py
Created Time: 2023-07-16
Author: Krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """移动一个圆盘"""
    # 从 src 顶部拿出一个圆盘
    pan = src.pop()
    # 将圆盘放入 tar 顶部
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """求解汉诺塔：问题 f(i)"""
    # 若 src 只剩下一个圆盘，则直接将其移到 tar
    if i == 1:
        move(src, tar)
        return
    # 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf)
    # 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar)
    # 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """求解汉诺塔"""
    n = len(A)
    # 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # 列表尾部是柱子顶部
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("初始状态下：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("圆盘移动完成后：")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
