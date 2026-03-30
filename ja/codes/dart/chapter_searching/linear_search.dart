/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* 線形探索（配列） */
int linearSearchArray(List<int> nums, int target) {
  // 配列を走査
  for (int i = 0; i < nums.length; i++) {
    // 目標要素が見つかったらそのインデックスを返す
    if (nums[i] == target) {
      return i;
    }
  }
  // 目標要素が見つからなければ -1 を返す
  return -1;
}

/* 線形探索（連結リスト） */
ListNode? linearSearchList(ListNode? head, int target) {
  // 連結リストを走査
  while (head != null) {
    // 対象ノードが見つかったら、それを返す
    if (head.val == target) return head;
    head = head.next;
  }
  // 対象要素が見つからない場合は `null` を返す
  return null;
}

/* Driver Code */
void main() {
  int target = 3;

  /* 配列で線形探索を行う */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('対象要素 3 のインデックス = $index');

  /* 連結リストで線形探索を行う */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目標ノード値 3 に対応するノードオブジェクトは $node です');
}
