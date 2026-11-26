/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* Linear search in an array */
int linearSearchArray(List<int> nums, int target) {
  // Traverse the array
  for (int i = 0; i < nums.length; i++) {
    // Found the target. Return its index
    if (nums[i] == target) {
      return i;
    }
  }
  // Target not found. Return -1
  return -1;
}

/* Linear search in a linked list */
ListNode? linearSearchList(ListNode? head, int target) {
  // Traverse the linked list
  while (head != null) {
    // Found the target node. Return it
    if (head.val == target) return head;
    head = head.next;
  }
  // Target element not found. Return null
  return null;
}

/* Driver code */
void main() {
  int target = 3;

  /* Run linear search on the array */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('Index of target 3 = $index');

  /* Run linear search on the linked list */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('Node object for target value 3 = $node');
}
