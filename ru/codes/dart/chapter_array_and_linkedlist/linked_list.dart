/**
 * File: linked_list.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';
import '../utils/print_util.dart';

/* Вставить узел P после узла n0 */
void insert(ListNode n0, ListNode P) {
  ListNode? n1 = n0.next;
  P.next = n1;
  n0.next = P;
}

/* Удалить первый узел, следующий за n0 */
void remove(ListNode n0) {
  if (n0.next == null) return;
  // n0 -> P -> n1
  ListNode P = n0.next!;
  ListNode? n1 = P.next;
  n0.next = n1;
}

/* Получить узел списка по индексу index */
ListNode? access(ListNode? head, int index) {
  for (var i = 0; i < index; i++) {
    if (head == null) return null;
    head = head.next;
  }
  return head;
}

/* Найти первый узел списка со значением target */
int find(ListNode? head, int target) {
  int index = 0;
  while (head != null) {
    if (head.val == target) {
      return index;
    }
    head = head.next;
    index++;
  }
  return -1;
}

/* Демонстрационный код */
void main() {
  // Инициализация связного списка
  // Инициализировать узлы
  ListNode n0 = ListNode(1);
  ListNode n1 = ListNode(3);
  ListNode n2 = ListNode(2);
  ListNode n3 = ListNode(5);
  ListNode n4 = ListNode(4);
  // Связать узлы ссылками
  n0.next = n1;
  n1.next = n2;
  n2.next = n3;
  n3.next = n4;

  print('Исходный связный список:');
  printLinkedList(n0);

  /* Вставка узла */
  insert(n0, ListNode(0));
  print('Связный список после вставки:');
  printLinkedList(n0);

  /* Удаление узла */
  remove(n0);
  print('Связный список после удаления:');
  printLinkedList(n0);

  /* Доступ к узлу */
  ListNode? node = access(n0, 3);
  print('Значение узла по индексу 3 = ${node!.val}');

  /* Поиск узла */
  int index = find(n0, 2);
  print('Индекс узла со значением 2 = $index');
}
