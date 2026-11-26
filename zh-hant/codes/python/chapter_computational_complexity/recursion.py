"""
File: recursion.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """遞迴"""
    # 終止條件
    if n == 1:
        return 1
    # 遞：遞迴呼叫
    res = recur(n - 1)
    # 迴：回傳結果
    return n + res


def for_loop_recur(n: int) -> int:
    """以迭代模擬遞迴"""
    # 自行建立堆疊，模擬系統的呼叫堆疊
    stack = []
    res = 0
    # 遞：遞迴呼叫
    for i in range(n, 0, -1):
        # 以「推入堆疊」模擬「遞」
        stack.append(i)
    # 迴：回傳結果
    while stack:
        # 以「彈出堆疊」模擬「迴」
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """尾端遞迴"""
    # 終止條件
    if n == 0:
        return res
    # 尾端遞迴呼叫
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """費氏數列：遞迴"""
    # 終止條件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # 回傳結果 f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\n遞迴函式的總和 res = {res}")

    res = for_loop_recur(n)
    print(f"\n以迭代模擬遞迴的總和 res = {res}")

    res = tail_recur(n, 0)
    print(f"\n尾端遞迴函式總和 res = {res}")

    res = fib(n)
    print(f"\n費氏數列的第 {n} 項為 {res}")
