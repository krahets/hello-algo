/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 階段登り：動的計画法 */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // 部分問題の解を保存するために dp テーブルを初期化
  List<int> dp = List.filled(n + 1, 0);
  // 初期状態：最小部分問題の解をあらかじめ設定
  dp[1] = 1;
  dp[2] = 2;
  // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* 階段登り：空間最適化した動的計画法 */
int climbingStairsDPComp(int n) {
  if (n == 1 || n == 2) return n;
  int a = 1, b = 2;
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = a + b;
    a = tmp;
  }
  return b;
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDP(n);
  print("$n 段の階段の登り方は全部で $res 通り");

  res = climbingStairsDPComp(n);
  print("$n 段の階段の登り方は全部で $res 通り");
}
