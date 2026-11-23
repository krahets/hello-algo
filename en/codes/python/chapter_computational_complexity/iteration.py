"""
File: iteration.py
Created Time: 2023-08-24
Author: krahets (krahets@163.com)
"""


def for_loop(n: int) -> int:
    """for loop"""
    res = 0
    # Sum 1, 2, ..., n-1, n in a loop
    for i in range(1, n + 1):
        res += i
    return res


def while_loop(n: int) -> int:
    """while loop"""
    res = 0
    i = 1  # Initialize the loop control variable
    # Sum 1, 2, ..., n-1, n in a loop
    while i <= n:
        res += i
        i += 1  # Update the loop control variable
    return res


def while_loop_ii(n: int) -> int:
    """while loop (two updates)"""
    res = 0
    i = 1  # Initialize the loop control variable
    # Sum 1, 4, 10, ... in a loop
    while i <= n:
        res += i
        # Update the loop control variable
        i += 1
        i *= 2
    return res


def nested_for_loop(n: int) -> str:
    """Nested for loops"""
    res = ""
    # Loop over i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # Loop over j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res += f"({i}, {j}), "
    return res


"""Driver code"""
if __name__ == "__main__":
    n = 5
    res = for_loop(n)
    print(f"\nSum from the for loop: res = {res}")

    res = while_loop(n)
    print(f"\nSum from the while loop: res = {res}")

    res = while_loop_ii(n)
    print(f"\nSum from the while loop (two updates): res = {res}")

    res = nested_for_loop(n)
    print(f"\nTraversal from the nested for loops: {res}")
