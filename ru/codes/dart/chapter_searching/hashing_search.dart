/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* Хеш-поиск (массив) */
int hashingSearchArray(Map<int, int> map, int target) {
  // key хеш-таблицы: целевой элемент, value: индекс
  // Если такого key нет в хеш-таблице, вернуть -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* Хеш-поиск (связный список) */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // key хеш-таблицы: значение целевого узла, value: объект узла
  // Если такого key нет в хеш-таблице, вернуть null
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
  // Инициализация хеш-таблицы
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: элемент, value: индекс
  }
  int index = hashingSearchArray(map, target);
  print('Индекс целевого элемента 3 = $index');

  /* Хеш-поиск (связный список) */
  ListNode? head = listToLinkedList(nums);
  // Инициализация хеш-таблицы
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: значение узла, value: узел
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('Объект узла со значением 3 = $node');
}
