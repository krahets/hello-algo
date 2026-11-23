/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Climbing stairs: dynamic programming */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // Initialize the dp table to store subproblem solutions
  List<int> dp = List.filled(n + 1, 0);
  // Initial states: set the solutions to the smallest subproblems
  dp[1] = 1;
  dp[2] = 2;
  // State transitions: solve progressively larger subproblems using smaller ones
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* Climbing stairs: space-optimized dynamic programming */
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

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsDP(n);
  print("Number of ways to climb $n stairs: $res");

  res = climbingStairsDPComp(n);
  print("Number of ways to climb $n stairs: $res");
}
