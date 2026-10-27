/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* Двоичный поиск самого левого элемента target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // Эквивалентно поиску точки вставки target
  int i = binarySearchInsertion(nums, target);
  // target не найден, вернуть -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // target найден, возвращается индекс i
  return i;
}

/* Двоичный поиск самого правого элемента target */
int binarySearchRightEdge(List<int> nums, int target) {
  // Преобразовать задачу в поиск самого левого target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j указывает на самый правый target, а i — на первый элемент больше target
  int j = i - 1;
  // target не найден, вернуть -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // target найден, возвращается индекс j
  return j;
}

/* Driver Code */
void main() {
  // Массив с повторяющимися элементами
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\nМассив nums = $nums");

  // Двоичный поиск левой и правой границы
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("Индекс самого левого элемента $target равен $index");
    index = binarySearchRightEdge(nums, target);
    print("Индекс самого правого элемента $target равен $index");
  }
}
