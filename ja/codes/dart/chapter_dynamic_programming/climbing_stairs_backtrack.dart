/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // n 段目に到達したら、方法の数を 1 増やす
  if (state == n) {
    res[0]++;
  }
  // すべての選択肢を走査する
  for (int choice in choices) {
    // 枝刈り：n 段目を越えてはならない
    if (state + choice > n) continue;
    // 試行：選択を行い、状態を更新する
    backtrack(choices, state + choice, n, res);
    // 復元
  }
}

/* 階段の上り方：バックトラッキング */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 1 段または 2 段上ることを選択できる
  int state = 0; // 0 段目から上り始める
  List<int> res = [];
  res.add(0); // res[0] に方法の数を記録する
  backtrack(choices, state, n, res);
  return res[0];
}

/* 実行用コード */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("$n 段の階段を上る方法は全部で $res 通り");
}
