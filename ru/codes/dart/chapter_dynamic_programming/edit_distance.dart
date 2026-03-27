/**
 * File: edit_distance.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Редакционное расстояние: полный перебор */
int editDistanceDFS(String s, String t, int i, int j) {
  // Если s и t пусты, вернуть 0
  if (i == 0 && j == 0) return 0;
  // Если s пусто, вернуть длину t
  if (i == 0) return j;
  // Если t пусто, вернуть длину s
  if (j == 0) return i;
  // Если два символа равны, сразу пропустить их
  if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1);
  // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
  int insert = editDistanceDFS(s, t, i, j - 1);
  int delete = editDistanceDFS(s, t, i - 1, j);
  int replace = editDistanceDFS(s, t, i - 1, j - 1);
  // Вернуть минимальное число шагов редактирования
  return min(min(insert, delete), replace) + 1;
}

/* Редакционное расстояние: поиск с мемоизацией */
int editDistanceDFSMem(String s, String t, List<List<int>> mem, int i, int j) {
  // Если s и t пусты, вернуть 0
  if (i == 0 && j == 0) return 0;
  // Если s пусто, вернуть длину t
  if (i == 0) return j;
  // Если t пусто, вернуть длину s
  if (j == 0) return i;
  // Если запись уже есть, сразу вернуть ее
  if (mem[i][j] != -1) return mem[i][j];
  // Если два символа равны, сразу пропустить их
  if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
  int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
  int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
  int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // Сохранить и вернуть минимальное число шагов редактирования
  mem[i][j] = min(min(insert, delete), replace) + 1;
  return mem[i][j];
}

/* Редакционное расстояние: динамическое программирование */
int editDistanceDP(String s, String t) {
  int n = s.length, m = t.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
  // Переход состояний: первая строка и первый столбец
  for (int i = 1; i <= n; i++) {
    dp[i][0] = i;
  }
  for (int j = 1; j <= m; j++) {
    dp[0][j] = j;
  }
  // Переход состояний: остальные строки и столбцы
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      if (s[i - 1] == t[j - 1]) {
        // Если два символа равны, сразу пропустить их
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
        dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[n][m];
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
int editDistanceDPComp(String s, String t) {
  int n = s.length, m = t.length;
  List<int> dp = List.filled(m + 1, 0);
  // Переход состояний: первая строка
  for (int j = 1; j <= m; j++) {
    dp[j] = j;
  }
  // Переход состояний: остальные строки
  for (int i = 1; i <= n; i++) {
    // Переход состояний: первый столбец
    int leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
    dp[0] = i;
    // Переход состояний: остальные столбцы
    for (int j = 1; j <= m; j++) {
      int temp = dp[j];
      if (s[i - 1] == t[j - 1]) {
        // Если два символа равны, сразу пропустить их
        dp[j] = leftup;
      } else {
        // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
        dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
      }
      leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
    }
  }
  return dp[m];
}

/* Driver Code */
void main() {
  String s = "bag";
  String t = "pack";
  int n = s.length, m = t.length;

  // Полный перебор
  int res = editDistanceDFS(s, t, n, m);
  print("Чтобы преобразовать " + s + " в " + t + ", нужно минимум $res шагов");

  // Поиск с мемоизацией
  List<List<int>> mem = List.generate(n + 1, (_) => List.filled(m + 1, -1));
  res = editDistanceDFSMem(s, t, mem, n, m);
  print("Чтобы преобразовать " + s + " в " + t + ", нужно минимум $res шагов");

  // Динамическое программирование
  res = editDistanceDP(s, t);
  print("Чтобы преобразовать " + s + " в " + t + ", нужно минимум $res шагов");

  // Динамическое программирование с оптимизацией памяти
  res = editDistanceDPComp(s, t);
  print("Чтобы преобразовать " + s + " в " + t + ", нужно минимум $res шагов");
}
