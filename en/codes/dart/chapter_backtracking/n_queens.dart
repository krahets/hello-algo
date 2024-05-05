/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: n queens */
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
    // Calculate the main and minor diagonals corresponding to the cell
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Attempt: place the queen in the cell
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Place the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Retract: restore the cell to an empty spot
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Solve n queens */
List<List<List<String>>> nQueens(int n) {
  // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Record columns with queens
  List<bool> diags1 = List.filled(2 * n - 1, false); // Record main diagonals with queens
  List<bool> diags2 = List.filled(2 * n - 1, false); // Record minor diagonals with queens
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Input chessboard dimensions as $n");
  print("There are ${res.length} queen placement solutions");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
