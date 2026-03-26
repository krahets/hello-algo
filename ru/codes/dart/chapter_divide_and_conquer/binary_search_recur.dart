/**
 * File: binary_search_recur.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Бинарный поиск: задача f(i, j) */
int dfs(List<int> nums, int target, int i, int j) {
  // Если диапазон пуст, это означает отсутствие целевого элемента, поэтому вернуть -1
  if (i > j) {
    return -1;
  }
  // Вычислить средний индекс m
  int m = (i + j) ~/ 2;
  if (nums[m] < target) {
    // Рекурсивная подзадача f(m+1, j)
    return dfs(nums, target, m + 1, j);
  } else if (nums[m] > target) {
    // Рекурсивная подзадача f(i, m-1)
    return dfs(nums, target, i, m - 1);
  } else {
    // Целевой элемент найден, вернуть его индекс
    return m;
  }
}

/* Бинарный поиск */
int binarySearch(List<int> nums, int target) {
  int n = nums.length;
  // Решить задачу f(0, n-1)
  return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  // Бинарный поиск (двусторонний закрытый интервал)
  int index = binarySearch(nums, target);
  print("Индекс целевого элемента 6 = $index");
}
