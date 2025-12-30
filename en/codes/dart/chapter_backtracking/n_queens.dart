/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: N queens */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // When all rows are placed, record the solution
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Traverse all columns
  for (int col = 0; col < n; col++) {
    // Calculate the main diagonal and anti-diagonal corresponding to this cell
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Attempt: place the queen in this cell
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Place the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Backtrack: restore this cell to an empty cell
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Solve N queens */
List<List<List<String>>> nQueens(int n) {
  // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Record whether there is a queen in the column
  List<bool> diags1 = List.filled(2 * n - 1, false); // Record whether there is a queen on the main diagonal
  List<bool> diags2 = List.filled(2 * n - 1, false); // Record whether there is a queen on the anti-diagonal
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Input board size is $n");
  print("Total queen placement solutions: ${res.length}");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
