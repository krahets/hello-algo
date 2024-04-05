/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 爬樓梯：動態規劃 */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // 初始化 dp 表，用於儲存子問題的解
  List<int> dp = List.filled(n + 1, 0);
  // 初始狀態：預設最小子問題的解
  dp[1] = 1;
  dp[2] = 2;
  // 狀態轉移：從較小子問題逐步求解較大子問題
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* 爬樓梯：空間最佳化後的動態規劃 */
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
  print("爬 $n 階樓梯共有 $res 種方案");

  res = climbingStairsDPComp(n);
  print("爬 $n 階樓梯共有 $res 種方案");
}
