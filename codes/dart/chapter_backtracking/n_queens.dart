/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯算法：n 皇后 */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // 当放置完所有行时，记录解
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // 遍历所有列
  for (int col = 0; col < n; col++) {
    // 计算该格子对应的主对角线和次对角线
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // 尝试：将皇后放置在该格子
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // 放置下一行
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // 回退：将该格子恢复为空位
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* 求解 n 皇后 */
List<List<List<String>>> nQueens(int n) {
  // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // 记录列是否有皇后
  List<bool> diags1 = List.filled(2 * n - 1, false); // 记录主对角线上是否有皇后
  List<bool> diags2 = List.filled(2 * n - 1, false); // 记录次对角线上是否有皇后
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("输入棋盘长宽为 $n");
  print("皇后放置方案共有 ${res.length} 种");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
