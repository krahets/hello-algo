/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: n-queens */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // Record a solution when a queen has been placed in every row
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Iterate over all columns
  for (int col = 0; col < n; col++) {
    // Calculate the main-diagonal and anti-diagonal indices for this square
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Try: place a queen on this square
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Place a queen in the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Backtrack: restore this square to empty
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Solve the n-queens problem */
List<List<List<String>>> nQueens(int n) {
  // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Track whether a column contains a queen
  List<bool> diags1 = List.filled(2 * n - 1, false); // Track whether a main diagonal contains a queen
  List<bool> diags2 = List.filled(2 * n - 1, false); // Track whether an anti-diagonal contains a queen
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Input board width and height: $n");
  print("Number of queen arrangements: ${res.length}");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
