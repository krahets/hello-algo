/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 爬樓梯的最低成本：動態規劃 */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // 初始化 dp 表，用來儲存子問題的解
  List<int> dp = List.filled(n + 1, 0);
  // 初始狀態：設定最小子問題的解
  dp[1] = cost[1];
  dp[2] = cost[2];
  // 狀態轉移：從較小的子問題逐步求出較大子問題的解
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* 爬樓梯的最低成本：空間最佳化後的動態規劃 */
int minCostClimbingStairsDPComp(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  int a = cost[1], b = cost[2];
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = min(a, tmp) + cost[i];
    a = tmp;
  }
  return b;
}

/* 主程式 */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("輸入的各階樓梯成本為 $cost");

  int res = minCostClimbingStairsDP(cost);
  print("爬完樓梯的最低成本為 $res");

  res = minCostClimbingStairsDPComp(cost);
  print("爬完樓梯的最低成本為 $res");
}
