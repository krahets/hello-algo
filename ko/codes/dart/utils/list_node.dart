/**
 * File: list_node.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// [region]{list_node}
/* 연결 리스트 노드 */
class ListNode {
  int val; // 노드 값
  ListNode? next; // 다음 노드를 가리키는 참조

  ListNode(this.val, [this.next]); // 생성자
}
// [endregion]{list_node}

/* 리스트를 연결 리스트로 역직렬화 */
ListNode? listToLinkedList(List<int> list) {
  ListNode dum = ListNode(0);
  ListNode? head = dum;
  for (int val in list) {
    head?.next = ListNode(val);
    head = head?.next;
  }
  return dum.next;
}
