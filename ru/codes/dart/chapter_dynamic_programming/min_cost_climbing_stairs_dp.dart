/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // Инициализация таблицы dp для хранения решений подзадач
  List<int> dp = List.filled(n + 1, 0);
  // Начальное состояние: заранее задать решения наименьших подзадач
  dp[1] = cost[1];
  dp[2] = cost[2];
  // Переход состояний: постепенное решение больших подзадач через меньшие
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
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

/* Driver Code */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("Список стоимостей ступеней = $cost");

  int res = minCostClimbingStairsDP(cost);
  print("Минимальная стоимость подъема по лестнице = $res");

  res = minCostClimbingStairsDPComp(cost);
  print("Минимальная стоимость подъема по лестнице = $res");
}
