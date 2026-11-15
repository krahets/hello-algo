/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// [region]{list_node}
/* Linked list node */
class ListNode {
  int val; // Node value
  ListNode? next; // Reference to the next node

  ListNode(this.val, [this.next]); // Constructor
}
// [endregion]{list_node}

/* Deserialize a list into a linked list */
ListNode? listToLinkedList(List<int> list) {
  ListNode dum = ListNode(0);
  ListNode? head = dum;
  for (int val in list) {
    head?.next = ListNode(val);
    head = head?.next;
  }
  return dum.next;
}
