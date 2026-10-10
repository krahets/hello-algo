/**
 * File: max_product_cutting.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Максимальное произведение разрезания: жадный алгоритм */
int maxProductCutting(int n) {
  // Когда n <= 3, обязательно нужно выделить одну 1
  if (n <= 3) {
    return 1 * (n - 1);
  }
  // Жадно выделить множители 3, где a — число троек, а b — остаток
  int a = n ~/ 3;
  int b = n % 3;
  if (b == 1) {
    // Если остаток равен 1, преобразовать одну пару 1 * 3 в 2 * 2
    return (pow(3, a - 1) * 2 * 2).toInt();
  }
  if (b == 2) {
    // Если остаток равен 2, ничего не делать
    return (pow(3, a) * 2).toInt();
  }
  // Если остаток равен 0, ничего не делать
  return pow(3, a).toInt();
}

/* Driver Code */
void main() {
  int n = 58;

  // Жадный алгоритм
  int res = maxProductCutting(n);
  print("Максимальное произведение после разрезания = $res");
}
