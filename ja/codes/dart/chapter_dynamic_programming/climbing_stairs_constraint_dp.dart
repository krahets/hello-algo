/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 制約付き階段登り：動的計画法 */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // 部分問題の解を保存するために dp テーブルを初期化
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // 初期状態：最小部分問題の解をあらかじめ設定
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("$n 段の階段の登り方は全部で $res 通り");
}
