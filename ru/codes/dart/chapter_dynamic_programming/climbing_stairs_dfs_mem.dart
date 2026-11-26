/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с мемоизацией */
int dfs(int i, List<int> mem) {
  // Для dp[1] и dp[2] вернуть известные значения
  if (i == 1 || i == 2) return i;
  // Если dp[i] уже вычислено, вернуть сохранённое значение
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // Сохранить dp[i]
  mem[i] = count;
  return count;
}

/* Подъём по лестнице: поиск с мемоизацией */
int climbingStairsDFSMem(int n) {
  // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* Основная программа */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("Число способов подняться на лестницу из $n ступеней: $res.");
}
