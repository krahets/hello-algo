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
    # 迴：返回結果
    return n + res


def for_loop_recur(n: int) -> int:
    """使用迭代模擬遞迴"""
    # 使用一個顯式的堆疊來模擬系統呼叫堆疊
    stack = []
    res = 0
    # 遞：遞迴呼叫
    for i in range(n, 0, -1):
        # 透過“入堆疊操作”模擬“遞”
        stack.append(i)
    # 迴：返回結果
    while stack:
        # 透過“出堆疊操作”模擬“迴”
        res += stack.pop()
    # res = 1+2+3+...+n
    return res


def tail_recur(n, res):
    """尾遞迴"""
    # 終止條件
    if n == 0:
        return res
    # 尾遞迴呼叫
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """費波那契數列：遞迴"""
    # 終止條件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # 返回結果 f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\n遞迴函式的求和結果 res = {res}")

    res = for_loop_recur(n)
    print(f"\n使用迭代模擬遞迴求和結果 res = {res}")

    res = tail_recur(n, 0)
    print(f"\n尾遞迴函式的求和結果 res = {res}")

    res = fib(n)
    print(f"\n費波那契數列的第 {n} 項為 {res}")
