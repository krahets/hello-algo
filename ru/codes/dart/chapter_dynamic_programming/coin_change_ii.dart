/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Размен монет II: динамическое программирование */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // Инициализировать таблицу dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // Инициализировать первый столбец
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // Переход между состояниями
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если номинал превышает нужную сумму, не брать монету i
        dp[i][a] = dp[i - 1][a];
      } else {
        // Сложить число комбинаций без монеты i и с ней
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* Размен монет II: динамическое программирование с экономией памяти */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // Инициализировать таблицу dp
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // Переход между состояниями
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если номинал превышает нужную сумму, не брать монету i
        dp[a] = dp[a];
      } else {
        // Сложить число комбинаций без монеты i и с ней
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* Основная программа */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // Динамическое программирование
  int res = coinChangeIIDP(coins, amt);
  print("Число комбинаций монет для заданной суммы: $res");

  // Динамическое программирование с экономией памяти
  res = coinChangeIIDPComp(coins, amt);
  print("Число комбинаций монет для заданной суммы: $res");
}
