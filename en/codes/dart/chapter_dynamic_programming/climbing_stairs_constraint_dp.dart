/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Climbing stairs with constraint: Dynamic programming */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // Initialize dp table, used to store solutions to subproblems
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // Initial state: preset the solution to the smallest subproblem
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // State transition: gradually solve larger subproblems from smaller ones
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
  print("Climbing $n stairs has $res solutions");
}
