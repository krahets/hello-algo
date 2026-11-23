/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Climbing stairs with constraints: dynamic programming */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // Initialize the dp table to store subproblem solutions
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // Initial states: set the solutions to the smallest subproblems
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // State transitions: solve progressively larger subproblems using smaller ones
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("Number of ways to climb $n stairs: $res");
}
