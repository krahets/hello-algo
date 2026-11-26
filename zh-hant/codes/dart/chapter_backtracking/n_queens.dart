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
  // 每一列都放好皇后後，記錄此解
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // 逐一檢查各欄
  for (int col = 0; col < n; col++) {
    // 計算這一格對應的主對角線與副對角線索引
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // 嘗試：將皇后放在這一格
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // 在下一列放置皇后
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // 回溯：將這一格還原為空位
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* 求解 n 皇后問題 */
List<List<List<String>>> nQueens(int n) {
  // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // 記錄各欄是否已有皇后
  List<bool> diags1 = List.filled(2 * n - 1, false); // 記錄各主對角線上是否已有皇后
  List<bool> diags2 = List.filled(2 * n - 1, false); // 記錄各副對角線上是否已有皇后
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* 主程式 */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("輸入棋盤的邊長為 $n");
  print("皇后共有 ${res.length} 種擺法");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
