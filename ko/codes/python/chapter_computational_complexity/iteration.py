"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for 문"""
    res = 0
    # 1, 2, ..., n-1, n을 차례로 더한다
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while 문"""
    res = 0
    i = 1  # 반복 조건에 쓰는 변수를 초기화한다
    # 1, 2, ..., n-1, n을 차례로 더한다
    while i <= n:
        res += i
        i += 1  # 반복 조건에 쓰는 변수를 갱신한다
    return res


def while_loop_ii(n: int) -> int:
    """while 문(한 번에 두 번 갱신)"""
    res = 0
    i = 1  # 반복 조건에 쓰는 변수를 초기화한다
    # 1, 4, 10, ...을 차례로 더한다
    while i <= n:
        res += i
        # 반복 조건에 쓰는 변수를 갱신한다
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """이중 for 문"""
    res = ""
    # i = 1, 2, ..., n-1, n에 대해 반복한다
    for i in range(1, n + 1):
        # j = 1, 2, ..., n-1, n에 대해 반복한다
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor 문의 합 res = {res}")

    res = while_loop(n)
    print(f"\nwhile 문의 합 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile 문(두 번 갱신)의 합 res = {res}")

    res = nested_for_loop(n)
    print(f"\n이중 for 문의 순회 결과: {res}")
