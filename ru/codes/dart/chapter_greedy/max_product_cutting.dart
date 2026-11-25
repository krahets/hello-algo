/**
 * File: max_product_cutting.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Максимальное произведение при разбиении: жадный алгоритм */
int maxProductCutting(int n) {
  // При n <= 3 одно из слагаемых обязательно равно 1
  if (n <= 3) {
    return 1 * (n - 1);
  }
  // Выделяем тройки жадно: a — число троек, b — остаток
  int a = n ~/ 3;
  int b = n % 3;
  if (b == 1) {
    // При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
    return (pow(3, a - 1) * 2 * 2).toInt();
  }
  if (b == 2) {
    // При остатке 2 ничего не меняем
    return (pow(3, a) * 2).toInt();
  }
  // При остатке 0 ничего не меняем
  return pow(3, a).toInt();
}

/* Пример запуска */
void main() {
  int n = 58;

  // Жадный алгоритм
  int res = maxProductCutting(n);
  print("Максимальное произведение при разбиении: $res");
}
