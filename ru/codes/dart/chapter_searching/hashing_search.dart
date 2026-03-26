/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* Хеш-поиск (массив) */
int hashingSearchArray(Map<int, int> map, int target) {
  // У хеш-таблицы key: целевой элемент, value: индекс
  // Если такого key в хеш-таблице нет, вернуть -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* Хеш-поиск (связный список) */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // У хеш-таблицы key: целевое значение узла, value: объект узла
  // Если такого key в хеш-таблице нет, вернуть null
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver Code */
void main() {
  int target = 3;

  /* Хеш-поиск (массив) */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // Инициализировать хеш-таблицу
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: элемент, value: индекс
  }
  int index = hashingSearchArray(map, target);
  print('Индекс целевого элемента 3 = $index');

  /* Хеш-поиск (связный список) */
  ListNode? head = listToLinkedList(nums);
  // Инициализировать хеш-таблицу
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: значение узла, value: узел
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('Объект узла, соответствующий целевому значению 3, равен $node');
}
