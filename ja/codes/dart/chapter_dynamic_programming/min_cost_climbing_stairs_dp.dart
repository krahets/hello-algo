/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 階段を上る最小コスト：動的計画法 */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // 部分問題の解を格納する dp テーブルを初期化する
  List<int> dp = List.filled(n + 1, 0);
  // 初期状態：最小の部分問題の解を設定する
  dp[1] = cost[1];
  dp[2] = cost[2];
  // 状態遷移：小さな部分問題から順に大きな部分問題を解く
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* 階段を上る最小コスト：空間を最適化した動的計画法 */
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

/* 実行用コード */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("入力した階段のコストのリストは $cost");

  int res = minCostClimbingStairsDP(cost);
  print("階段を上り終える最小コストは $res");

  res = minCostClimbingStairsDPComp(cost);
  print("階段を上り終える最小コストは $res");
}
