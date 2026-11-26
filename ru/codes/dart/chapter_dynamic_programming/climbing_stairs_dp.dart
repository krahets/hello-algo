/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Подъём по лестнице: динамическое программирование */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // Создать таблицу dp для решений подзадач
  List<int> dp = List.filled(n + 1, 0);
  // Начальные состояния: задать решения простейших подзадач
  dp[1] = 1;
  dp[2] = 2;
  // Переход: решать подзадачи от меньших к большим
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
int climbingStairsDPComp(int n) {
  if (n == 1 || n == 2) return n;
  int a = 1, b = 2;
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = a + b;
    a = tmp;
  }
  return b;
}

/* Основная программа */
void main() {
  int n = 9;

  int res = climbingStairsDP(n);
  print("Число способов подняться на лестницу из $n ступеней: $res.");

  res = climbingStairsDPComp(n);
  print("Число способов подняться на лестницу из $n ступеней: $res.");
}
