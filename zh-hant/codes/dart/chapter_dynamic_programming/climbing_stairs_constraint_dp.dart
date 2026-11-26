/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 有限制的爬樓梯問題：動態規劃 */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // 初始化 dp 表，用來儲存子問題的解
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // 初始狀態：設定最小子問題的解
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // 狀態轉移：從較小的子問題逐步求出較大子問題的解
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* 主程式 */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("爬 $n 階樓梯共有 $res 種走法");
}
