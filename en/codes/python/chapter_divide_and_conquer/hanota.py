"""
File: hanota.py
Created Time: 2023-07-16
Author: krahets (krahets@163.com)
"""


def move(src: list[int], tar: list[int]):
    """Move a disk"""
    # Take out a disk from the top of src
    pan = src.pop()
    # Place the disk on top of tar
    tar.append(pan)


def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
    """Solve the Tower of Hanoi problem f(i)"""
    # If there is only one disk left in src, move it directly to tar
    if i == 1:
        move(src, tar)
        return
    # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
    dfs(i - 1, src, tar, buf)
    # Subproblem f(1): move the remaining disk from src to tar
    move(src, tar)
    # Subproblem f(i-1): move the top i-1 disks from buf to tar using src
    dfs(i - 1, buf, src, tar)


def solve_hanota(A: list[int], B: list[int], C: list[int]):
    """Solve the Tower of Hanoi problem"""
    n = len(A)
    # Move the top n disks from A to C using B
    dfs(n, A, B, C)


"""Driver Code"""
if __name__ == "__main__":
    # The tail of the list is the top of the rod
    A = [5, 4, 3, 2, 1]
    B = []
    C = []
    print("Initial state:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")

    solve_hanota(A, B, C)

    print("After moving the disks:")
    print(f"A = {A}")
    print(f"B = {B}")
    print(f"C = {C}")
