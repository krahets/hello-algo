/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* Hash-based search (array) */
int hashingSearchArray(Map<int, int> map, int target) {
  // Hash table key: target element; value: index
  // Return -1 if the hash table does not contain this key
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* Hash-based search (linked list) */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // Hash table key: target node value; value: node object
  // Return null if this key is absent from the hash table
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver code */
void main() {
  int target = 3;

  /* Hash-based search (array) */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // Initialize the hash table
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: element; value: index
  }
  int index = hashingSearchArray(map, target);
  print('Index of target element 3 = $index');

  /* Hash-based search (linked list) */
  ListNode? head = listToLinkedList(nums);
  // Initialize the hash table
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: node value; value: node
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('Node object with target value 3: $node');
}
