/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 鏈結串列節點 */
class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

/* 將串列反序列化為鏈結串列 */
ListNode? listToLinkedList(List<int> list) {
  ListNode dum = ListNode(0);
  ListNode? head = dum;
  for (int val in list) {
    head?.next = ListNode(val);
    head = head?.next;
  }
  return dum.next;
}
