/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* 線形探索（配列） */
int linearSearchArray(List<int> nums, int target) {
  // 配列を走査する
  for (int i = 0; i < nums.length; i++) {
    // 目的の要素が見つかったので、そのインデックスを返す
    if (nums[i] == target) {
      return i;
    }
  }
  // 目的の要素が見つからなかったので、-1 を返す
  return -1;
}

/* 線形探索（連結リスト） */
ListNode? linearSearchList(ListNode? head, int target) {
  // 連結リストを走査する
  while (head != null) {
    // 目的のノードが見つかったので、それを返す
    if (head.val == target) return head;
    head = head.next;
  }
  // 目的の要素が見つからなかったので、null を返す
  return null;
}

/* 実行用コード */
void main() {
  int target = 3;

  /* 配列で線形探索を行う */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('目的の要素 3 のインデックス = $index');

  /* 連結リストで線形探索を行う */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目的のノードの値 3 に対応するノードオブジェクトは $node');
}
