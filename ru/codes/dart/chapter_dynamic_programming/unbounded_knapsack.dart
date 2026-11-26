/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Неограниченный рюкзак: динамическое программирование */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализировать таблицу dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // Переход между состояниями
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Если предмет i тяжелее допустимого, пропустить его
        dp[i][c] = dp[i - 1][c];
      } else {
        // Взять максимум из двух вариантов: без предмета i и с ним
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализировать таблицу dp
  List<int> dp = List.filled(cap + 1, 0);
  // Переход между состояниями
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Если предмет i тяжелее допустимого, пропустить его
        dp[c] = dp[c];
      } else {
        // Взять максимум из двух вариантов: без предмета i и с ним
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Основная программа */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // Динамическое программирование
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("Максимальная стоимость предметов, помещающихся в рюкзак: $res");

  // Динамическое программирование с экономией памяти
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("Максимальная стоимость предметов, помещающихся в рюкзак: $resComp");
}
