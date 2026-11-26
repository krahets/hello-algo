/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Минимальная сумма на пути: полный перебор */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // При достижении верхней левой ячейки завершить поиск
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
  if (i < 0 || j < 0) {
    // В Dart тип int имеет ограниченный диапазон и не содержит значения для бесконечности
    return BigInt.from(2).pow(31).toInt();
  }
  // Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
  return min(left, up) + grid[i][j];
}

/* Минимальная сумма на пути: поиск с мемоизацией */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // При достижении верхней левой ячейки завершить поиск
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
  if (i < 0 || j < 0) {
    // В Dart тип int имеет ограниченный диапазон и не содержит значения для бесконечности
    return BigInt.from(2).pow(31).toInt();
  }
  // Если результат сохранён, сразу вернуть его
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // Минимальные стоимости путей до ячеек слева и сверху
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* Минимальная сумма на пути: динамическое программирование */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Инициализировать таблицу dp
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // Переход: первая строка
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // Переход: первый столбец
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // Переход: остальные строки и столбцы
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Инициализировать таблицу dp
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // Переход: остальные строки
  for (int i = 1; i < n; i++) {
    // Переход: первый столбец
    dp[0] = dp[0] + grid[i][0];
    // Переход: остальные столбцы
    for (int j = 1; j < m; j++) {
      dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
    }
  }
  return dp[m - 1];
}

/* Основная программа */
void main() {
  List<List<int>> grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
  ];
  int n = grid.length, m = grid[0].length;

// Полный перебор
  int res = minPathSumDFS(grid, n - 1, m - 1);
  print("Минимальная сумма на пути из верхнего левого в нижний правый угол: $res");

// Поиск с мемоизацией
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("Минимальная сумма на пути из верхнего левого в нижний правый угол: $res");

// Динамическое программирование
  res = minPathSumDP(grid);
  print("Минимальная сумма на пути из верхнего левого в нижний правый угол: $res");

// Динамическое программирование с экономией памяти
  res = minPathSumDPComp(grid);
  print("Минимальная сумма на пути из верхнего левого в нижний правый угол: $res");
}
