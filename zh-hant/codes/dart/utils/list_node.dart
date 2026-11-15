/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// [region]{list_node}
/* 鏈結串列節點 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 指向下一節點的引用

  ListNode(this.val, [this.next]); // 建構子
}
// [endregion]{list_node}

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
