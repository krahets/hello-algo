/**
 * File: coin_change_greedy.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Размен монет: жадный алгоритм */
int coinChangeGreedy(List<int> coins, int amt) {
  // Предположим, что список coins упорядочен
  int i = coins.length - 1;
  int count = 0;
  // Повторять жадный выбор, пока не останется суммы
  while (amt > 0) {
    // Найти монету, которая меньше оставшейся суммы и ближе всего к ней
    while (i > 0 && coins[i] > amt) {
      i--;
    }
    // Выбрать coins[i]
    amt -= coins[i];
    count++;
  }
  // Если допустимое решение не найдено, вернуть -1
  return amt == 0 ? count : -1;
}

/* Driver Code */
void main() {
  // Жадный подход: позволяет гарантированно найти глобально оптимальное решение
  List<int> coins = [1, 5, 10, 20, 50, 100];
  int amt = 186;
  int res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для получения $amt минимальное число монет равно $res");

  // Жадный подход: не гарантирует нахождение глобально оптимального решения
  coins = [1, 20, 50];
  amt = 60;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для получения $amt минимальное число монет равно $res");
  print("Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20");

  // Жадный подход: не гарантирует нахождение глобально оптимального решения
  coins = [1, 49, 50];
  amt = 98;
  res = coinChangeGreedy(coins, amt);
  print("\ncoins = $coins, amt = $amt");
  print("Для получения $amt минимальное число монет равно $res");
  print("Фактически минимальное необходимое количество равно 2, то есть 49 + 49");
}
