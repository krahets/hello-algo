/**
 * File: binary_search_recur.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Двоичный поиск: задача f(i, j) */
int dfs(List<int> nums, int target, int i, int j) {
  // Если интервал пуст, искомого элемента нет. Возвращаем -1
  if (i > j) {
    return -1;
  }
  // Вычисляем индекс середины m
  int m = (i + j) ~/ 2;
  if (nums[m] < target) {
    // Рекурсивно решаем подзадачу f(m+1, j)
    return dfs(nums, target, m + 1, j);
  } else if (nums[m] > target) {
    // Рекурсивно решаем подзадачу f(i, m-1)
    return dfs(nums, target, i, m - 1);
  } else {
    // Искомый элемент найден. Возвращаем его индекс
    return m;
  }
}

/* Двоичный поиск */
int binarySearch(List<int> nums, int target) {
  int n = nums.length;
  // Решаем задачу f(0, n-1)
  return dfs(nums, target, 0, n - 1);
}

/* Основная программа */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  // Двоичный поиск (замкнутый интервал)
  int index = binarySearch(nums, target);
  print("Индекс элемента 6 = $index");
}
