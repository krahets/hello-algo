/**
 * File: linear_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import '../utils/list_node.dart';

/* Linear search (array) */
int linearSearchArray(List<int> nums, int target) {
  // Traverse the array
  for (int i = 0; i < nums.length; i++) {
    // The target element was found; return its index
    if (nums[i] == target) {
      return i;
    }
  }
  // The target element was not found; return -1
  return -1;
}

/* Linear search (linked list) */
ListNode? linearSearchList(ListNode? head, int target) {
  // Traverse the linked list
  while (head != null) {
    // The target node was found; return it
    if (head.val == target) return head;
    head = head.next;
  }
  // The target element was not found; return null
  return null;
}

/* Driver code */
void main() {
  int target = 3;

  /* Perform linear search on the array */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  int index = linearSearchArray(nums, target);
  print('Index of target element 3 = $index');

  /* Perform linear search on the linked list */
  ListNode? head = listToLinkedList(nums);
  ListNode? node = linearSearchList(head, target);
  print('Node object with target value 3: $node');
}
