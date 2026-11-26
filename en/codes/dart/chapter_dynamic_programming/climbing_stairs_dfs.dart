/**
 * File: climbing_stairs_dfs.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Search */
int dfs(int i) {
  // Return the known value for dp[1] or dp[2]
  if (i == 1 || i == 2) return i;
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1) + dfs(i - 2);
  return count;
}

/* Climbing stairs with search */
int climbingStairsDFS(int n) {
  return dfs(n);
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsDFS(n);
  print("Climbing $n stairs: $res ways");
}
