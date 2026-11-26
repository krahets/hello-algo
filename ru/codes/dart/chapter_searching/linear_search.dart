/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* Линейный поиск в массиве */
int linearSearchArray(List<int> nums, int target) {
  // Обходим массив
  for (int i = 0; i < nums.length; i++) {
    // Элемент найден, возвращаем его индекс
    if (nums[i] == target) {
      return i;
    }
  }
  // Элемент не найден, возвращаем -1
  return -1;
}

/* Линейный поиск в связном списке */
ListNode? linearSearchList(ListNode? head, int target) {
  // Обходим связный список
  while (head != null) {
    // Нужный узел найден, возвращаем его
    if (head.val == target) return head;
    head = head.next;
  }
  // Искомый элемент не найден, возвращаем null
  return null;
}

/* Пример использования */
void main() {
  int target = 3;

  /* Выполняем линейный поиск в массиве */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('Индекс элемента 3 = $index');

  /* Выполняем линейный поиск в связном списке */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('Узел со значением 3: $node');
}
