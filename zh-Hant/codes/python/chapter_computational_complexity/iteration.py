"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for 迴圈"""
    res = 0
    # 迴圈求和 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while 迴圈"""
    res = 0
    i = 1  # 初始化條件變數
    # 迴圈求和 1, 2, ..., n-1, n
    while i <= n:
        res += i
        i += 1  # 更新條件變數
    return res


def while_loop_ii(n: int) -> int:
    """while 迴圈（兩次更新）"""
    res = 0
    i = 1  # 初始化條件變數
    # 迴圈求和 1, 4, 10, ...
    while i <= n:
        res += i
        # 更新條件變數
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """雙層 for 迴圈"""
    res = ""
    # 迴圈 i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # 迴圈 j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor 迴圈的求和結果 res = {res}")

    res = while_loop(n)
    print(f"\nwhile 迴圈的求和結果 res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile 迴圈（兩次更新）求和結果 res = {res}")

    res = nested_for_loop(n)
    print(f"\n雙層 for 迴圈的走訪結果 {res}")
