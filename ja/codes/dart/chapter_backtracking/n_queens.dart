/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキングによる n クイーン問題 */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // すべての行に置いたら解を記録する
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // すべての列を調べる
  for (int col = 0; col < n; col++) {
    // このマスを通る主対角線と副対角線を求める
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // 試行：このマスにクイーンを置く
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // 次の行に置く
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // 後戻り：このマスを空きに戻す
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* n クイーン問題を解く */
List<List<List<String>>> nQueens(int n) {
  // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // 各列にクイーンがあるか記録する
  List<bool> diags1 = List.filled(2 * n - 1, false); // 各主対角線にクイーンがあるか記録する
  List<bool> diags2 = List.filled(2 * n - 1, false); // 各副対角線にクイーンがあるか記録する
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* 実行例 */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("盤面の一辺の長さ：$n");
  print("クイーンの配置は全部で ${res.length} 通り");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
