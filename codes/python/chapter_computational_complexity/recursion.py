"""
File: recursion.py
Created Time: 2023-08-24
Author: Krahets (krahets@163.com)
"""


def recur(n: int) -> int:
    """递归"""
    # 终止条件
    if n == 1:
        return 1
    # 递：递归调用
    res = recur(n - 1)
    # 归：返回结果
    return n + res


def tail_recur(n, res):
    """尾递归"""
    # 终止条件
    if n == 0:
        return res
    # 尾递归调用
    return tail_recur(n - 1, res + n)


def fib(n: int) -> int:
    """斐波那契数列：递归"""
    # 终止条件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 递归调用 f(n) = f(n-1) + f(n-2)
    res = fib(n - 1) + fib(n - 2)
    # 返回结果 f(n)
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = recur(n)
    print(f"\n递归函数的求和结果 res = {res}")

    res = tail_recur(n, 0)
    print(f"\n尾递归函数的求和结果 res = {res}")

    res = fib(n)
    print(f"\n斐波那契数列的第 {n} 项为 {res}")
