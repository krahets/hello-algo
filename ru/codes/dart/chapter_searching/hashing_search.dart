/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* Поиск по хеш-таблице в массиве */
int hashingSearchArray(Map<int, int> map, int target) {
  // Ключ хеш-таблицы — искомый элемент, значение — его индекс
  // Если ключа в хеш-таблице нет, возвращаем -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* Поиск по хеш-таблице в связном списке */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
  // Если ключа в хеш-таблице нет, возвращаем null
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Пример использования */
void main() {
  int target = 3;

  /* Поиск по хеш-таблице в массиве */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // Создаём хеш-таблицу
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // Ключ — элемент, значение — индекс
  }
  int index = hashingSearchArray(map, target);
  print('Индекс элемента 3 = $index');

  /* Поиск по хеш-таблице в связном списке */
  ListNode? head = listToLinkedList(nums);
  // Создаём хеш-таблицу
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // Ключ — значение узла, значение — сам узел
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('Узел со значением 3: $node');
}
