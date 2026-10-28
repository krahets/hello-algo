"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for 반복문"""
    res = 0
    # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while 반복문"""
    res = 0
    i = 1  # 조건 변수를 초기화한다
    # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while i <= n:
        res += i
        i += 1  # 조건 변수를 갱신한다
    return res


def while_loop_ii(n: int) -> int:
    """while 반복문(두 번 갱신)"""
    res = 0
    i = 1  # 조건 변수를 초기화한다
    # 반복문으로 1, 4, 10, ...의 합을 구한다
    while i <= n:
        res += i
        # 조건 변수를 갱신한다
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """이중 for 반복문"""
    res = ""
    # i = 1, 2, ..., n-1, n을 반복한다
    for i in range(1, n + 1):
        # j = 1, 2, ..., n-1, n을 반복한다
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""실행 코드"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor 반복문으로 구한 합 res = {res}")

    res = while_loop(n)
    print(f"\nwhile 반복문으로 구한 합 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile 반복문(두 번 갱신)으로 구한 합 res = {res}")

    res = nested_for_loop(n)
    print(f"\n이중 for 반복문의 순회 결과 {res}")
