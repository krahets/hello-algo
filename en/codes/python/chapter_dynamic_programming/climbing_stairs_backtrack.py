"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Backtracking"""
    # When climbing to the n-th stair, add 1 to the solution count
    if state == n:
        res[0] += 1
    # Traverse all choices
    for choice in choices:
        # Pruning: not allowed to go beyond the n-th stair
        if state + choice > n:
            continue
        # Attempt: make a choice, update state
        backtrack(choices, state + choice, n, res)
        # Backtrack


def climbing_stairs_backtrack(n: int) -> int:
    """Climbing stairs: Backtracking"""
    choices = [1, 2]  # Can choose to climb up 1 or 2 stairs
    state = 0  # Start climbing from the 0-th stair
    res = [0]  # Use res[0] to record the solution count
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Climbing {n} stairs has {res} solutions")
