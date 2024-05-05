/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Climbing stairs with minimum cost: Dynamic programming */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // Initialize dp table, used to store subproblem solutions
  List<int> dp = List.filled(n + 1, 0);
  // Initial state: preset the smallest subproblem solution
  dp[1] = cost[1];
  dp[2] = cost[2];
  // State transition: gradually solve larger subproblems from smaller ones
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* Climbing stairs with minimum cost: Space-optimized dynamic programming */
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
  print("Input cost list for stairs as $cost");

  int res = minCostClimbingStairsDP(cost);
  print("Minimum cost to climb the stairs = $res");

  res = minCostClimbingStairsDPComp(cost);
  print("Minimum cost to climb the stairs = $res");
}
