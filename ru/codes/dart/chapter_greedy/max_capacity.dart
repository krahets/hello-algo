/**
 * File: max_capacity.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Максимальная вместимость: жадный алгоритм */
int maxCapacity(List<int> ht) {
  // Инициализировать i и j так, чтобы они располагались на двух концах массива
  int i = 0, j = ht.length - 1;
  // Начальная максимальная вместимость равна 0
  int res = 0;
  // Повторять жадный выбор, пока две доски не встретятся
  while (i < j) {
    // Обновить максимальную вместимость
    int cap = min(ht[i], ht[j]) * (j - i);
    res = max(res, cap);
    // Сдвинуть внутрь более короткую сторону
    if (ht[i] < ht[j]) {
      i++;
    } else {
      j--;
    }
  }
  return res;
}

/* Driver Code */
void main() {
  List<int> ht = [3, 8, 5, 2, 7, 7, 3, 4];

  // Жадный алгоритм
  int res = maxCapacity(ht);
  print("максимальныйвместимостьравно $res");
}
