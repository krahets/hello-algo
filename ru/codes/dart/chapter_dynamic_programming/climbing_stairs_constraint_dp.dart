/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Подъём по лестнице с ограничением: динамическое программирование */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return 1;
  }
  // Создать таблицу dp для решений подзадач
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // Начальные состояния: задать решения простейших подзадач
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // Переход: решать подзадачи от меньших к большим
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* Основная программа */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("Число способов подняться на лестницу из $n ступеней: $res.");
}
