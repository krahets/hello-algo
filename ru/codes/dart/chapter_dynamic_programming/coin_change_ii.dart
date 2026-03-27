/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Размен монет II: динамическое программирование */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // Инициализация таблицы dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // Инициализация первого столбца
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // Переход состояний
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если целевая сумма превышена, монету i не выбирать
        dp[i][a] = dp[i - 1][a];
      } else {
        // Сумма двух решений: не брать или взять монету i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // Инициализация таблицы dp
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // Переход состояний
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // Если целевая сумма превышена, монету i не выбирать
        dp[a] = dp[a];
      } else {
        // Сумма двух решений: не брать или взять монету i
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // Динамическое программирование
  int res = coinChangeIIDP(coins, amt);
  print("Количество комбинаций монет для набора целевой суммы = $res");

  // Динамическое программирование с оптимизацией памяти
  res = coinChangeIIDPComp(coins, amt);
  print("Количество комбинаций монет для набора целевой суммы = $res");
}
