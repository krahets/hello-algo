/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラック */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // n 段目に着いたら、登り方の数を 1 増やす
  if (state == n) {
    res[0]++;
  }
  // すべての選択肢を調べる
  for (int choice in choices) {
    // 枝刈り：n 段目を越えないようにする
    if (state + choice > n) continue;
    // 選択肢を試し、状態を更新する
    backtrack(choices, state + choice, n, res);
    // 選択を取り消す
  }
}

/* 階段の登り方：バックトラック */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 1 段または 2 段登れる
  int state = 0; // 0 段目から登り始める
  List<int> res = [];
  res.add(0); // res[0] に登り方の数を記録する
  backtrack(choices, state, n, res);
  return res[0];
}

/* 実行例 */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("全 $n 段の階段の登り方は $res 通り");
}
