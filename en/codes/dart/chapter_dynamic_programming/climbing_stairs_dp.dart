/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Climbing stairs: Dynamic programming */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // Initialize dp table, used to store solutions to subproblems
  List<int> dp = List.filled(n + 1, 0);
  // Initial state: preset the solution to the smallest subproblem
  dp[1] = 1;
  dp[2] = 2;
  // State transition: gradually solve larger subproblems from smaller ones
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* Climbing stairs: Space-optimized dynamic programming */
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
  print("Climbing $n stairs has $res solutions");

  res = climbingStairsDPComp(n);
  print("Climbing $n stairs has $res solutions");
}
