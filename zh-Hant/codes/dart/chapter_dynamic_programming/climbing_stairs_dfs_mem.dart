/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 記憶化搜尋 */
int dfs(int i, List<int> mem) {
  // 已知 dp[1] 和 dp[2] ，返回之
  if (i == 1 || i == 2) return i;
  // 若存在記錄 dp[i] ，則直接返回之
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // 記錄 dp[i]
  mem[i] = count;
  return count;
}

/* 爬樓梯：記憶化搜尋 */
int climbingStairsDFSMem(int n) {
  // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("爬 $n 階樓梯共有 $res 種方案");
}
