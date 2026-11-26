/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Двоичный поиск первого вхождения target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // Задача равносильна поиску позиции вставки target
  int i = binarySearchInsertion(nums, target);
  // Значение target не найдено, возвращаем -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // Значение target найдено, возвращаем индекс i
  return i;
}

/* Двоичный поиск последнего вхождения target */
int binarySearchRightEdge(List<int> nums, int target) {
  // Сводим задачу к поиску первого вхождения target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j указывает на последнее вхождение target, а i — на первый элемент, больший target
  int j = i - 1;
  // Значение target не найдено, возвращаем -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // Значение target найдено, возвращаем индекс j
  return j;
}

/* Пример использования */
void main() {
  // Массив с повторяющимися элементами
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nМассив nums = $nums");

  // Двоичный поиск левой и правой границ
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Индекс первого вхождения $target = $index");
    index = binarySearchRightEdge(nums, target);
    print("Индекс последнего вхождения $target = $index");
  }
}
