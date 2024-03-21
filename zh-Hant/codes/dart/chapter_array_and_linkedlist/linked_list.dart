/**
 * File: linked_list.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';
import '../utils/print_util.dart';

/* 在鏈結串列的節點 n0 之後插入節點 P */
void insert(ListNode n0, ListNode P) {
  ListNode? n1 = n0.next;
  P.next = n1;
  n0.next = P;
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
void remove(ListNode n0) {
  if (n0.next == null) return;
  // n0 -> P -> n1
  ListNode P = n0.next!;
  ListNode? n1 = P.next;
  n0.next = n1;
}

/* 訪問鏈結串列中索引為 index 的節點 */
ListNode? access(ListNode? head, int index) {
  for (var i = 0; i < index; i++) {
    if (head == null) return null;
    head = head.next;
  }
  return head;
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
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

/* Driver Code */
void main() {
  // 初始化鏈結串列
  // 初始化各個節點
  ListNode n0 = ListNode(1);
  ListNode n1 = ListNode(3);
  ListNode n2 = ListNode(2);
  ListNode n3 = ListNode(5);
  ListNode n4 = ListNode(4);
  // 構建節點之間的引用
  n0.next = n1;
  n1.next = n2;
  n2.next = n3;
  n3.next = n4;

  print('初始化的鏈結串列為');
  printLinkedList(n0);

  /* 插入節點 */
  insert(n0, ListNode(0));
  print('插入節點後的鏈結串列為');
  printLinkedList(n0);

  /* 刪除節點 */
  remove(n0);
  print('刪除節點後的鏈結串列為');
  printLinkedList(n0);

  /* 訪問節點 */
  ListNode? node = access(n0, 3);
  print('鏈結串列中索引 3 處的節點的值 = ${node!.val}');

  /* 查詢節點 */
  int index = find(n0, 2);
  print('鏈結串列中值為 2 的節點的索引 = $index');
}
