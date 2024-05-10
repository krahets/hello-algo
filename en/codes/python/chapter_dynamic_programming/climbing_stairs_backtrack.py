"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Backtracking"""
    # When climbing to the nth step, add 1 to the number of solutions
    if state == n:
        res[0] += 1
    # Traverse all choices
    for choice in choices:
        # Pruning: do not allow climbing beyond the nth step
        if state + choice > n:
            continue
        # Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res)
        # Retract


def climbing_stairs_backtrack(n: int) -> int:
    """Climbing stairs: Backtracking"""
    choices = [1, 2]  # Can choose to climb up 1 step or 2 steps
    state = 0  # Start climbing from the 0th step
    res = [0]  # Use res[0] to record the number of solutions
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Climb {n} steps, there are {res} solutions in total")
