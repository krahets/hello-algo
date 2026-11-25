/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Двоичный поиск позиции вставки без повторов */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Задаём замкнутый интервал [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Вычисляем индекс середины m
    if (nums[m] < target) {
      i = m + 1; // Ищем target в интервале [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Ищем target в интервале [i, m-1]
    } else {
      return m; // Значение target найдено, возвращаем позицию вставки m
    }
  }
  // Значение target не найдено, возвращаем позицию вставки i
  return i;
}

/* Двоичный поиск позиции вставки при наличии повторов */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // Задаём замкнутый интервал [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // Вычисляем индекс середины m
    if (nums[m] < target) {
      i = m + 1; // Ищем target в интервале [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // Ищем target в интервале [i, m-1]
    } else {
      j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
    }
  }
  // Возвращаем позицию вставки i
  return i;
}

/* Пример использования */
void main() {
  // Массив без повторяющихся элементов
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\nМассив nums = $nums");
  // Двоичный поиск позиции вставки
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("Позиция вставки элемента $target = $index");
  }

  // Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nМассив nums = $nums");
  // Двоичный поиск позиции вставки
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("Позиция вставки элемента $target = $index");
  }
}
