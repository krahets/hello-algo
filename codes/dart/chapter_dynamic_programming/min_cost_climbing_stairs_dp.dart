/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 爬楼梯最小代价：动态规划 */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // 初始化 dp 表，用于存储子问题的解
  List<int> dp = List.filled(n + 1, 0);
  // 初始状态：预设最小子问题的解
  dp[1] = cost[1];
  dp[2] = cost[2];
  // 状态转移：从较小子问题逐步求解较大子问题
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* 爬楼梯最小代价：空间优化后的动态规划 */
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

/* Driver Code */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("输入楼梯的代价列表为 $cost");

  int res = minCostClimbingStairsDP(cost);
  print("爬完楼梯的最低代价为 $res");

  res = minCostClimbingStairsDPComp(cost);
  print("爬完楼梯的最低代价为 $res");
}
