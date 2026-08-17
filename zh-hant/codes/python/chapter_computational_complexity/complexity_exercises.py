"""
File: complexity_exercises.py
Created Time: 2026-08-18
Author: Hello Algo Team
"""


def sum_iter(n: int) -> int:
    """迭代求和"""
    res = 0
    for i in range(1, n + 1):
        res += i
    return res


def sum_recur(n: int) -> int:
    """遞迴求和"""
    if n == 1:
        return 1
    return n + sum_recur(n - 1)


def linear_loop(n: int) -> int:
    """線性階迴圈"""
    res = 0
    for i in range(n):
        res += i
    return res


def quadratic_loop(n: int) -> int:
    """平方階迴圈"""
    res = 0
    for i in range(n):
        for j in range(i, n):
            res += j
    return res


def logarithmic_loop(n: int) -> int:
    """對數階迴圈"""
    while n > 1:
        n //= 2
    return n


if __name__ == "__main__":
    assert sum_iter(1) == sum_recur(1) == 1
    assert sum_iter(4) == sum_recur(4) == 10
    assert linear_loop(4) == 6
    assert quadratic_loop(4) == 20
    assert logarithmic_loop(4) == logarithmic_loop(5) == 1
