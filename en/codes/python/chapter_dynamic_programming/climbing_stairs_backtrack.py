"""
File: climbing_stairs_backtrack.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
    """Backtracking"""
    # Count one more way when we reach stair n
    if state == n:
        res[0] += 1
    # Iterate over all choices
    for choice in choices:
        # Prune moves that would overshoot stair n
        if state + choice > n:
            continue
        # Try a choice and update the state
        backtrack(choices, state + choice, n, res)
        # Undo the choice


def climbing_stairs_backtrack(n: int) -> int:
    """Climbing stairs with backtracking"""
    choices = [1, 2]  # Each move can climb 1 or 2 stairs
    state = 0  # Start at stair 0
    res = [0]  # Store the number of ways in res[0]
    backtrack(choices, state, n, res)
    return res[0]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_backtrack(n)
    print(f"Climbing {n} stairs: {res} ways")
