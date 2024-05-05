"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """Move a disc"""
    # Take out a disc from the top of src
    pan = src.pop()
    # Place the disc on top of tar
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """Solve the Tower of Hanoi problem f(i)"""
    # If only one disc remains on src, move it to tar
    if i == 1:
        move(src, tar)
        return
    # Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i - 1, src, tar, buf)
    # Subproblem f(1): move the remaining one disc from src to tar
    move(src, tar)
    # Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """Solve the Tower of Hanoi problem"""
    n = len(A)
    # Move the top n discs from A with the help of B to C
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # The tail of the list is the top of the pillar
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("Initial state:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("After the discs are moved:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
