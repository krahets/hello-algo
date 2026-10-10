/**
 * File: climbing_stairs_dfs.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 検索 */
int dfs(int i) {
  // dp[1] と dp[2] は既知なので返す
  if (i == 1 || i == 2) return i;
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1) + dfs(i - 2);
  return count;
}

/* 階段登り：探索 */
int climbingStairsDFS(int n) {
  return dfs(n);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFS(n);
  print("$n 段の階段の登り方は全部で $res 通り");
}
