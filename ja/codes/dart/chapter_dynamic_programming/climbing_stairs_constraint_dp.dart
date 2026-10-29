/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 制約付きの階段の上り方：動的計画法 */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // 部分問題の解を格納する dp テーブルを初期化する
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // 初期状態：最小の部分問題の解を設定する
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // 状態遷移：小さな部分問題から順に大きな部分問題を解く
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* 実行用コード */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("$n 段の階段を上る方法は全部で $res 通り");
}
