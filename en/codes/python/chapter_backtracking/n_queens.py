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
    # Record a solution when a queen has been placed in every row
    if row == n:
        res.append([list(row) for row in state])
        return
    # Iterate over all columns
    for col in range(n):
        # Calculate the main-diagonal and anti-diagonal indices for this square
        diag1 = row - col + n - 1
        diag2 = row + col
        # Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Try: place a queen on this square
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Backtrack: restore this square to empty
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Solve the n-queens problem"""
    # Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Track whether a column contains a queen
    diags1 = [False] * (2 * n - 1)  # Track whether a main diagonal contains a queen
    diags2 = [False] * (2 * n - 1)  # Track whether an anti-diagonal contains a queen
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"The input board has width and height {n}")
    print(f"Number of ways to place the queens: {len(res)}")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
