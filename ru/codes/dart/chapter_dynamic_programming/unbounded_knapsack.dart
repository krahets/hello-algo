/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Полный рюкзак: динамическое программирование */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализация таблицы dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // Переход состояний
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Если вместимость рюкзака превышена, предмет i не выбирать
        dp[i][c] = dp[i - 1][c];
      } else {
        // Большее из двух решений: не брать или взять предмет i
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* Полный рюкзак: динамическое программирование с оптимизацией памяти */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализация таблицы dp
  List<int> dp = List.filled(cap + 1, 0);
  // Переход состояний
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Если вместимость рюкзака превышена, предмет i не выбирать
        dp[c] = dp[c];
      } else {
        // Большее из двух решений: не брать или взять предмет i
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Driver Code */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // Динамическое программирование
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("Максимальная стоимость предметов без превышения вместимости рюкзака = $res");

  // Динамическое программирование с оптимизацией памяти
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("Максимальная стоимость предметов без превышения вместимости рюкзака = $resComp");
}
