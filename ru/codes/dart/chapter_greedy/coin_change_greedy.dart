/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(List<int> coins, int amt) {
  // Список coins предполагается отсортированным
  int i = coins.length - 1;
  int count = 0;
  // Повторяем жадный выбор, пока остаток суммы не обнулится
  while (amt > 0) {
    // Ищем ближайший к остатку номинал среди меньших, чем остаток
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // Берём coins[i]
    amt -= coins[i];
    count++;
  }
  // Если решения не нашлось, возвращаем -1
  return amt == 0 ? count : -1;
}

/* Пример запуска */
void main() {
  // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для суммы $amt минимальное число монет: $res");

  // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для суммы $amt минимальное число монет: $res");
  print("На самом деле минимум — 3 монеты: 20 + 20 + 20");

  // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для суммы $amt минимальное число монет: $res");
  print("На самом деле минимум — 2 монеты: 49 + 49");
}
