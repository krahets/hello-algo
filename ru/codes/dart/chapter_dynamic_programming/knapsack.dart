/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Рюкзак 0-1: полный перебор */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Вернуть вариант с большей стоимостью из двух возможных
  return max(no, yes);
}

/* Рюкзак 0-1: поиск с мемоизацией */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // Если запись уже существует, вернуть ее напрямую
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Сохранить и вернуть более выгодный из двух вариантов
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* Рюкзак 0-1: динамическое программирование */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализировать таблицу dp
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // Переход состояния
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Если вместимость рюкзака превышена, не брать предмет i
        dp[i][c] = dp[i - 1][c];
      } else {
        // Выбрать большее из двух вариантов: не брать или взять предмет i
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Инициализировать таблицу dp
  List<int> dp = List.filled(cap + 1, 0);
  // Переход состояния
  for (int i = 1; i <= n; i++) {
    // Обойти в обратном порядке
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // Выбрать большее из двух вариантов: не брать или взять предмет i
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Driver Code */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;
  int n = wgt.length;

  // Полный перебор
  int res = knapsackDFS(wgt, val, n, cap);
  print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res");

  // Поиск с мемоизацией
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res");

  // Динамическое программирование
  res = knapsackDP(wgt, val, cap);
  print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res");

  // Динамическое программирование с оптимизацией по памяти
  res = knapsackDPComp(wgt, val, cap);
  print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res");
}
