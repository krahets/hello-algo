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
    """Backtracking algorithm: N queens"""
    # When all rows are placed, record the solution
    if row == n:
        res.append([list(row) for row in state])
        return
    # Traverse all columns
    for col in range(n):
        # Calculate the main diagonal and anti-diagonal corresponding to this cell
        diag1 = row - col + n - 1
        diag2 = row + col
        # Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Attempt: place the queen in this cell
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Backtrack: restore this cell to an empty cell
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Solve N queens"""
    # Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Record whether there is a queen in the column
    diags1 = [False] * (2 * n - 1)  # Record whether there is a queen on the main diagonal
    diags2 = [False] * (2 * n - 1)  # Record whether there is a queen on the anti-diagonal
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Input chessboard size is {n}")
    print(f"There are {len(res)} queen placement solutions")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
