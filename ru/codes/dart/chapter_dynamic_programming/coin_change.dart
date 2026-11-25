/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Размен монет: динамическое программирование */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Инициализировать таблицу dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // Переход: первая строка и первый столбец
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // Переход: остальные строки и столбцы
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если номинал превышает нужную сумму, не брать монету i
        dp[i][a] = dp[i - 1][a];
      } else {
        // Взять минимум из двух вариантов: без монеты i и с ней
        dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с экономией памяти */
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Инициализировать таблицу dp
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // Переход между состояниями
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если номинал превышает нужную сумму, не брать монету i
        dp[a] = dp[a];
      } else {
        // Взять минимум из двух вариантов: без монеты i и с ней
        dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[amt] != MAX ? dp[amt] : -1;
}

/* Основная программа */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 4;

  // Динамическое программирование
  int res = coinChangeDP(coins, amt);
  print("Минимальное число монет для заданной суммы: $res");

  // Динамическое программирование с экономией памяти
  res = coinChangeDPComp(coins, amt);
  print("Минимальное число монет для заданной суммы: $res");
}
