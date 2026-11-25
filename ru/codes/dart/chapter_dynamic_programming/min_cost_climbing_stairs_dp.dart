/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Минимальная стоимость подъёма: динамическое программирование */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // Создать таблицу dp для решений подзадач
  List<int> dp = List.filled(n + 1, 0);
  // Начальные состояния: задать решения простейших подзадач
  dp[1] = cost[1];
  dp[2] = cost[2];
  // Переход: решать подзадачи от меньших к большим
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
int minCostClimbingStairsDPComp(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  int a = cost[1], b = cost[2];
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = min(a, tmp) + cost[i];
    a = tmp;
  }
  return b;
}

/* Основная программа */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("Стоимость ступеней: $cost");

  int res = minCostClimbingStairsDP(cost);
  print("Минимальная стоимость подъёма: $res");

  res = minCostClimbingStairsDPComp(cost);
  print("Минимальная стоимость подъёма: $res");
}
