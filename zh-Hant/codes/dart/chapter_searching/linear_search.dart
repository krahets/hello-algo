/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* 线性查找（数组） */
int linearSearchArray(List<int> nums, int target) {
  // 遍历数组
  for (int i = 0; i < nums.length; i++) {
    // 找到目标元素，返回其索引
    if (nums[i] == target) {
      return i;
    }
  }
  // 未找到目标元素，返回 -1
  return -1;
}

/* 线性查找（链表） */
ListNode? linearSearchList(ListNode? head, int target) {
  // 遍历链表
  while (head != null) {
    // 找到目标节点，返回之
    if (head.val == target) return head;
    head = head.next;
  }
  // 未找到目标元素，返回 null
  return null;
}

/* Driver Code */
void main() {
  int target = 3;

  /* 在数组中执行线性查找 */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('目标元素 3 的索引 = $index');

  /* 在链表中执行线性查找 */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目标节点值 3 的对应节点对象为 $node');
}
