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
    """Backtracking algorithm: n queens"""
    # When all rows are placed, record the solution
    if row == n:
        res.append([list(row) for row in state])
        return
    # Traverse all columns
    for col in range(n):
        # Calculate the main and minor diagonals corresponding to the cell
        diag1 = row - col + n - 1
        diag2 = row + col
        # Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if not cols[col] and not diags1[diag1] and not diags2[diag2]:
            # Attempt: place the queen in the cell
            state[row][col] = "Q"
            cols[col] = diags1[diag1] = diags2[diag2] = True
            # Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            # Retract: restore the cell to an empty spot
            state[row][col] = "#"
            cols[col] = diags1[diag1] = diags2[diag2] = False


def n_queens(n: int) -> list[list[list[str]]]:
    """Solve n queens"""
    # Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    state = [["#" for _ in range(n)] for _ in range(n)]
    cols = [False] * n  # Record columns with queens
    diags1 = [False] * (2 * n - 1)  # Record main diagonals with queens
    diags2 = [False] * (2 * n - 1)  # Record minor diagonals with queens
    res = []
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res


"""Driver Code"""
if __name__ == "__main__":
    n = 4
    res = n_queens(n)

    print(f"Input chessboard dimensions as {n}")
    print(f"The total number of queen placement solutions is {len(res)}")
    for state in res:
        print("--------------------")
        for row in state:
            print(row)
