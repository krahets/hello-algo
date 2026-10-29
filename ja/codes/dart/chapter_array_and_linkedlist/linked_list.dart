/**
 * File: linked_list.dart
 * Created Time: 2023-01-23
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';
import '../utils/print_util.dart';

/* 連結リストのノード n0 の直後にノード P を挿入する */
void insert(ListNode n0, ListNode P) {
  ListNode? n1 = n0.next;
  P.next = n1;
  n0.next = P;
}

/* 連結リストのノード n0 の直後のノードを削除する */
void remove(ListNode n0) {
  if (n0.next == null) return;
  // n0 -> P -> n1
  ListNode P = n0.next!;
  ListNode? n1 = P.next;
  n0.next = n1;
}

/* 連結リストのインデックス index にあるノードにアクセスする */
ListNode? access(ListNode? head, int index) {
  for (var i = 0; i < index; i++) {
    if (head == null) return null;
    head = head.next;
  }
  return head;
}

/* 連結リストから値が target である最初のノードを探索する */
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

/* 実行用コード */
void main() {
  // 連結リストを初期化する
  // 各ノードを初期化する
  ListNode n0 = ListNode(1);
  ListNode n1 = ListNode(3);
  ListNode n2 = ListNode(2);
  ListNode n3 = ListNode(5);
  ListNode n4 = ListNode(4);
  // ノード間の参照を設定する
  n0.next = n1;
  n1.next = n2;
  n2.next = n3;
  n3.next = n4;

  print('初期化した連結リスト');
  printLinkedList(n0);

  /* ノードを挿入する */
  insert(n0, ListNode(0));
  print('ノードを挿入した後の連結リスト');
  printLinkedList(n0);

  /* ノードを削除する */
  remove(n0);
  print('ノードを削除した後の連結リスト');
  printLinkedList(n0);

  /* ノードにアクセスする */
  ListNode? node = access(n0, 3);
  print('連結リストのインデックス 3 にあるノードの値 = ${node!.val}');

  /* ノードを探索する */
  int index = find(n0, 2);
  print('連結リスト内で値が 2 であるノードのインデックス = $index');
}
