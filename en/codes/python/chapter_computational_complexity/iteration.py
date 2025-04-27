"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for loop"""
    res = 0
    # Loop sum 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while loop"""
    res = 0
    i = 1  # Initialize condition variable
    # Loop sum 1, 2, ..., n-1, n
    while i <= n:
        res += i
        i += 1  # Update condition variable
    return res


def while_loop_ii(n: int) -> int:
    """while loop (two updates)"""
    res = 0
    i = 1  # Initialize condition variable
    # Loop sum 1, 4, 10, ...
    while i <= n:
        res += i
        # Update condition variable
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """Double for loop"""
    res = ""
    # Loop i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # Loop j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nfor loop sum result res = {res}")

    res = while_loop(n)
    print(f"\nwhile loop sum result res = {res}")

    res = while_loop_ii(n)
    print(f"\nwhile loop (two updates) sum result res = {res}")

    res = nested_for_loop(n)
    print(f"\nDouble for loop traversal result {res}")
