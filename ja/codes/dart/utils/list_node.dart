/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// [region]{list_node}
/* 連結リストのノード */
class ListNode {
  int val; // ノードの値
  ListNode? next; // 次のノードへの参照

  ListNode(this.val, [this.next]); // コンストラクタ
}
// [endregion]{list_node}

/* リストをデシリアライズして連結リストにする */
ListNode? listToLinkedList(List<int> list) {
  ListNode dum = ListNode(0);
  ListNode? head = dum;
  for (int val in list) {
    head?.next = ListNode(val);
    head = head?.next;
  }
  return dum.next;
}
