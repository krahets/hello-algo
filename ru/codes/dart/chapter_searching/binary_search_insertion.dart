/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Вычислить индекс середины m
    if (nums[m] < target) {
      i = m + 1; // target находится в интервале [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // target находится в интервале [i, m-1]
    } else {
      return m; // Найти target и вернуть точку вставки m
    }
  }
  // target не найден, вернуть точку вставки i
  return i;
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Вычислить индекс середины m
    if (nums[m] < target) {
      i = m + 1; // target находится в интервале [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // target находится в интервале [i, m-1]
    } else {
      j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
    }
  }
  // Вернуть точку вставки i
  return i;
}

/* Driver Code */
void main() {
  // Массив без повторяющихся элементов
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\nМассив nums = $nums");
  // Бинарный поиск точки вставки
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("Индекс позиции вставки элемента $target равен $index");
  }

  // Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nМассив nums = $nums");
  // Бинарный поиск точки вставки
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("Индекс позиции вставки элемента $target равен $index");
  }
}
