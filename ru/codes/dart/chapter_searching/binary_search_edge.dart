/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Бинарный поиск самого левого target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // Эквивалентно поиску точки вставки для target
  int i = binarySearchInsertion(nums, target);
  // Если target не найден, вернуть -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // Найти target и вернуть индекс i
  return i;
}

/* Бинарный поиск самого правого target */
int binarySearchRightEdge(List<int> nums, int target) {
  // Преобразовать задачу в поиск самого левого элемента target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j указывает на самый правый target, а i указывает на первый элемент, больший target
  int j = i - 1;
  // Если target не найден, вернуть -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // Найти target и вернуть индекс j
  return j;
}

/* Driver Code */
void main() {
  // Массив с повторяющимися элементами
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nмассив nums = $nums");

  // Бинарный поиск левой и правой границ
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Индекс самого левого элемента $target равен $index");
    index = binarySearchRightEdge(nums, target);
    print("Индекс самого правого элемента $target равен $index");
  }
}
