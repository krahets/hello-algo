/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Memoized search */
int dfs(int i, List<int> mem) {
  // Return the known value for dp[1] or dp[2]
  if (i == 1 || i == 2) return i;
  // Return dp[i] directly if it is cached
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // Cache dp[i]
  mem[i] = count;
  return count;
}

/* Climbing stairs with memoized search */
int climbingStairsDFSMem(int n) {
  // mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("Climbing $n stairs: $res ways");
}
