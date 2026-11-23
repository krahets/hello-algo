"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Backtracking"""
    # When step n is reached, increase the number of ways by 1
    if state == n:
        res[0] += 1
    # Iterate over all choices
    for choice in choices:
        # Prune: do not go beyond step n
        if state + choice > n:
            continue
        # Try: make a choice and update the state
        backtrack(choices, state + choice, n, res)
        # Backtrack


def climbing_stairs_backtrack(n: int) -> int:
    """Climbing stairs: backtracking"""
    choices = [1, 2]  # Choose to climb 1 or 2 steps
    state = 0  # Start climbing from step 0
    res = [0]  # Use res[0] to record the number of ways
    backtrack(choices, state, n, res)
    return res[0]


"""Driver code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Number of ways to climb {n} stairs: {res}")
