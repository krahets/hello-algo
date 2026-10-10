/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Минимальная сумма пути: полный перебор */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // Если это верхняя левая ячейка, завершить поиск
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
  if (i < 0 || j < 0) {
    // В Dart тип int — целое число фиксированного диапазона; значения, представляющего «бесконечность», не существует
    return BigInt.from(2).pow(31).toInt();
  }
  // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
  return min(left, up) + grid[i][j];
}

/* Минимальная сумма пути: поиск с мемоизацией */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // Если это верхняя левая ячейка, завершить поиск
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
  if (i < 0 || j < 0) {
    // В Dart тип int — целое число фиксированного диапазона; значения, представляющего «бесконечность», не существует
    return BigInt.from(2).pow(31).toInt();
  }
  // Если запись уже есть, вернуть сразу
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // Минимальная стоимость пути для левой и верхней ячеек
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* Минимальная сумма пути: динамическое программирование */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Инициализация таблицы dp
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // Переход состояний: первая строка
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // Переход состояний: первый столбец
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // Переход состояний: остальные строки и столбцы
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Инициализация таблицы dp
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // Переход состояний: остальные строки
  for (int i = 1; i < n; i++) {
    // Переход состояний: первый столбец
    dp[0] = dp[0] + grid[i][0];
    // Переход состояний: остальные столбцы
    for (int j = 1; j < m; j++) {
      dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
    }
  }
  return dp[m - 1];
}

/* Driver Code */
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
  print("Минимальная сумма пути из левого верхнего угла в правый нижний = $res");

// Поиск с мемоизацией
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("Минимальная сумма пути из левого верхнего угла в правый нижний = $res");

// Динамическое программирование
  res = minPathSumDP(grid);
  print("Минимальная сумма пути из левого верхнего угла в правый нижний = $res");

// Динамическое программирование с оптимизацией памяти
  res = minPathSumDPComp(grid);
  print("Минимальная сумма пути из левого верхнего угла в правый нижний = $res");
}
