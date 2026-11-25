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
  // Record the solution once every row has a queen
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Try each column
  for (int col = 0; col < n; col++) {
    // Find the two diagonals through this square
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Prune if the column or either diagonal already has a queen
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Try placing a queen on this square
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Place a queen in the next row
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Backtrack: clear this square
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Solve the n-queens problem */
List<List<List<String>>> nQueens(int n) {
  // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Track occupied columns
  List<bool> diags1 = List.filled(2 * n - 1, false); // Track occupied main diagonals
  List<bool> diags2 = List.filled(2 * n - 1, false); // Track occupied secondary diagonals
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Board side length: $n");
  print("Found ${res.length} queen arrangements");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
