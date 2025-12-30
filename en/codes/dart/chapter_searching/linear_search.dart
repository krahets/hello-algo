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
    // Found the target element, return its index
    if (nums[i] == target) {
      return i;
    }
  }
  // Target element not found, return -1
  return -1;
}

/* Linear search (linked list) */
ListNode? linearSearchList(ListNode? head, int target) {
  // Traverse the linked list
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
  print('Index of target element 3 = $index');

  /* Perform linear search in linked list */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('Node object corresponding to target node value 3 is $node');
}
