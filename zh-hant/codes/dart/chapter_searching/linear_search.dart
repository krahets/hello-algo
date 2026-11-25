/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* 循序搜尋（陣列） */
int linearSearchArray(List<int> nums, int target) {
  // 走訪陣列
  for (int i = 0; i < nums.length; i++) {
    // 找到目標元素，回傳其索引
    if (nums[i] == target) {
      return i;
    }
  }
  // 找不到目標元素，回傳 -1
  return -1;
}

/* 循序搜尋（鏈結串列） */
ListNode? linearSearchList(ListNode? head, int target) {
  // 走訪鏈結串列
  while (head != null) {
    // 找到目標節點，回傳該節點
    if (head.val == target) return head;
    head = head.next;
  }
  // 找不到目標元素，回傳 null
  return null;
}

/* 主程式 */
void main() {
  int target = 3;

  /* 在陣列中執行循序搜尋 */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('目標元素 3 的索引 = $index');

  /* 在鏈結串列中執行循序搜尋 */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目標值 3 對應的節點物件為 $node');
}
