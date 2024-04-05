/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯演算法：n 皇后 */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // 當放置完所有行時，記錄解
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // 走訪所有列
  for (int col = 0; col < n; col++) {
    // 計算該格子對應的主對角線和次對角線
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // 嘗試：將皇后放置在該格子
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // 放置下一行
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // 回退：將該格子恢復為空位
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* 求解 n 皇后 */
List<List<List<String>>> nQueens(int n) {
  // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // 記錄列是否有皇后
  List<bool> diags1 = List.filled(2 * n - 1, false); // 記錄主對角線上是否有皇后
  List<bool> diags2 = List.filled(2 * n - 1, false); // 記錄次對角線上是否有皇后
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("輸入棋盤長寬為 $n");
  print("皇后放置方案共有 ${res.length} 種");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
