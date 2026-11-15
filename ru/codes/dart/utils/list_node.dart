/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// [region]{list_node}
/* Узел связного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на следующий узел

  ListNode(this.val, [this.next]); // Конструктор
}
// [endregion]{list_node}

/* Десериализовать список в связный список */
ListNode? listToLinkedList(List<int> list) {
  ListNode dum = ListNode(0);
  ListNode? head = dum;
  for (int val in list) {
    head?.next = ListNode(val);
    head = head?.next;
  }
  return dum.next;
}
