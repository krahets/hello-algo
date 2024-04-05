/**
 * File: climbing_stairs_dfs.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 搜尋 */
int dfs(int i) {
  // 已知 dp[1] 和 dp[2] ，返回之
  if (i == 1 || i == 2) return i;
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1) + dfs(i - 2);
  return count;
}

/* 爬樓梯：搜尋 */
int climbingStairsDFS(int n) {
  return dfs(n);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFS(n);
  print("爬 $n 階樓梯共有 $res 種方案");
}
