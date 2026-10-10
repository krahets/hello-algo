/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // 第 n 段に到達したら、方法数を 1 増やす
  if (state == n) {
    res[0]++;
  }
  // すべての選択肢を走査
  for (int choice in choices) {
    // 枝刈り: 第 n 段を超えないようにする
    if (state + choice > n) continue;
    // 試行: 選択を行い、状態を更新
    backtrack(choices, state + choice, n, res);
    // バックトラック
  }
}

/* 階段登り：バックトラッキング */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 1 段または 2 段上ることを選べる
  int state = 0; // 第 0 段から上り始める
  List<int> res = [];
  res.add(0); // res[0] を使って方法数を記録する
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("$n 段の階段の登り方は全部で $res 通り");
}
