/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* Линейный поиск (массив) */
int linearSearchArray(List<int> nums, int target) {
  // Обход массива
  for (int i = 0; i < nums.length; i++) {
    // Целевой элемент найден, вернуть его индекс
    if (nums[i] == target) {
      return i;
    }
  }
  // Целевой элемент не найден, вернуть -1
  return -1;
}

/* Линейный поиск (связный список) */
ListNode? linearSearchList(ListNode? head, int target) {
  // Обойти связный список
  while (head != null) {
    // Найти целевой узел и вернуть его
    if (head.val == target) return head;
    head = head.next;
  }
  // Целевой элемент не найден, вернуть null
  return null;
}

/* Driver Code */
void main() {
  int target = 3;

  /* Выполнить линейный поиск в массиве */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('Индекс целевого элемента 3 = $index');

  /* Выполнить линейный поиск в связном списке */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('Объект узла со значением 3 = $node');
}
