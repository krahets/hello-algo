/**
 * File: climbing_stairs_dfs.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Search */
int dfs(int i) {
  // The values of dp[1] and dp[2] are known; return them
  if (i == 1 || i == 2) return i;
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1) + dfs(i - 2);
  return count;
}

/* Climbing stairs: search */
int climbingStairsDFS(int n) {
  return dfs(n);
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsDFS(n);
  print("Number of ways to climb $n stairs: $res");
}
