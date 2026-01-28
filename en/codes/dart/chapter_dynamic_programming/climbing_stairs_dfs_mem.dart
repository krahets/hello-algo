/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Memoization search */
int dfs(int i, List<int> mem) {
  // Known dp[1] and dp[2], return them
  if (i == 1 || i == 2) return i;
  // If record dp[i] exists, return it directly
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // Record dp[i]
  mem[i] = count;
  return count;
}

/* Climbing stairs: Memoization search */
int climbingStairsDFSMem(int n) {
  // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("Climbing $n stairs has $res solutions");
}
