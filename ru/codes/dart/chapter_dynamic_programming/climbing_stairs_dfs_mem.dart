/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с мемоизацией */
int dfs(int i, List<int> mem) {
  // dp[1] и dp[2] уже известны, вернуть их
  if (i == 1 || i == 2) return i;
  // Если запись dp[i] существует, сразу вернуть ее
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // Сохранить dp[i]
  mem[i] = count;
  return count;
}

/* Подъем по лестнице: поиск с мемоизацией */
int climbingStairsDFSMem(int n) {
  // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("Количество способов подняться по лестнице из $n ступеней = $res");
}
