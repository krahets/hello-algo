"""
File: n_queens.py
Created Time: 2023-04-26
Author: krahets (krahets@163.com)
"""


def backtrack(
    row: int,
    n: int,
    state: list[list[str]],
    res: list[list[list[str]]],
    cols: list[bool],
    diags1: list[bool],
    diags2: list[bool],
):
    """Backtracking: n-queens"""
    # Record the solution once every row has a queen
    if row == n:
        res.append([list(row) for row in state])
        return
    # Try each column
    for col in range(n):
        # Find the two diagonals through this square
        diag1 = row - col + n - 1
        diag2 = row + col
        # Prune if the column or either diagonal already has a queen
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Try placing a queen on this square
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Backtrack: clear this square
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Solve the n-queens problem"""
    # Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Track occupied columns
    diags1 = [False] * (2 * n - 1)  # Track occupied main diagonals
    diags2 = [False] * (2 * n - 1)  # Track occupied secondary diagonals
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Board side length: {n}")
    print(f"Found {len(res)} queen arrangements")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
