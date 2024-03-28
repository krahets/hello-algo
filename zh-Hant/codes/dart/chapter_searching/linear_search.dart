/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* 線性查詢（陣列） */
int linearSearchArray(List<int> nums, int target) {
  // 走訪陣列
  for (int i = 0; i < nums.length; i++) {
    // 找到目標元素，返回其索引
    if (nums[i] == target) {
      return i;
    }
  }
  // 未找到目標元素，返回 -1
  return -1;
}

/* 線性查詢（鏈結串列） */
ListNode? linearSearchList(ListNode? head, int target) {
  // 走訪鏈結串列
  while (head != null) {
    // 找到目標節點，返回之
    if (head.val == target) return head;
    head = head.next;
  }
  // 未找到目標元素，返回 null
  return null;
}

/* Driver Code */
void main() {
  int target = 3;

  /* 在陣列中執行線性查詢 */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('目標元素 3 的索引 = $index');

  /* 在鏈結串列中執行線性查詢 */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目標節點值 3 的對應節點物件為 $node');
}
