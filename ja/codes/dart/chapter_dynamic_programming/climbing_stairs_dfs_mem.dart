/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* メモ化探索 */
int dfs(int i, List<int> mem) {
  // dp[1] と dp[2] は既知なので返す
  if (i == 1 || i == 2) return i;
  // dp[i] の記録があれば、それをそのまま返す
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // dp[i] を記録する
  mem[i] = count;
  return count;
}

/* 階段登り：メモ化探索 */
int climbingStairsDFSMem(int n) {
  // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("$n 段の階段の登り方は全部で $res 通り");
}
