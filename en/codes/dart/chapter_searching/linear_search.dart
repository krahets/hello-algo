/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* Linear search (array) */
int linearSearchArray(List<int> nums, int target) {
  // Traverse array
  for (int i = 0; i < nums.length; i++) {
    // Found the target element, thus return its index
    if (nums[i] == target) {
      return i;
    }
  }
  // Did not find the target element, thus return -1
  return -1;
}

/* Linear search (linked list) */
ListNode? linearSearchList(ListNode? head, int target) {
  // Traverse the list
  while (head != null) {
    // Found the target node, return it
    if (head.val == target) return head;
    head = head.next;
  }
  // Target element not found, return null
  return null;
}

/* Driver Code */
void main() {
  int target = 3;

  /* Perform linear search in array */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('目标元素 3 的索引 = $index');

  /* Perform linear search in linked list */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('目标节点值 3 的对应节点对象为 $node');
}
