/**
 * File: linked_list.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';
import '../utils/print_util.dart';

/* 在链表的节点 n0 之后插入节点 P */
void insert(ListNode n0, ListNode P) {
  ListNode? n1 = n0.next;
  P.next = n1;
  n0.next = P;
}

/* 删除链表的节点 n0 之后的首个节点 */
void remove(ListNode n0) {
  if (n0.next == null) return;
  // n0 -> P -> n1
  ListNode P = n0.next!;
  ListNode? n1 = P.next;
  n0.next = n1;
}

/* 访问链表中索引为 index 的节点 */
ListNode? access(ListNode? head, int index) {
  for (var i = 0; i < index; i++) {
    if (head == null) return null;
    head = head.next;
  }
  return head;
}

/* 在链表中查找值为 target 的首个节点 */
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
  // 初始化链表
  // 初始化各个节点
  ListNode n0 = ListNode(1);
  ListNode n1 = ListNode(3);
  ListNode n2 = ListNode(2);
  ListNode n3 = ListNode(5);
  ListNode n4 = ListNode(4);
  // 构建节点之间的引用
  n0.next = n1;
  n1.next = n2;
  n2.next = n3;
  n3.next = n4;

  print('初始化的链表为');
  printLinkedList(n0);

  /* 插入节点 */
  insert(n0, ListNode(0));
  print('插入节点后的链表为');
  printLinkedList(n0);

  /* 删除节点 */
  remove(n0);
  print('删除节点后的链表为');
  printLinkedList(n0);

  /* 访问节点 */
  ListNode? node = access(n0, 3);
  print('链表中索引 3 处的节点的值 = ${node!.val}');

  /* 查找节点 */
  int index = find(n0, 2);
  print('链表中值为 2 的节点的索引 = $index');
}
