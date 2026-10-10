"""
File: fast_power.py
Created Time: 2026-08-18
Author: Hello Algo Team
"""


def fast_pow(x: int, n: int) -> int:
    """高速べき乗"""
    if n == 0:
        return 1
    half = fast_pow(x, n // 2)
    if n % 2 == 0:
        return half * half
    return half * half * x


if __name__ == "__main__":
    assert fast_pow(7, 0) == 1
    assert fast_pow(3, 5) == 243
    assert fast_pow(2, 6) == 64
