/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* Hash search (array) */
int hashingSearchArray(Map<int, int> map, int target) {
  // Hash table's key: target element, value: index
  // If the hash table does not contain this key, return -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* Hash search (linked list) */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // Hash table key: target node value, value: node object
  // If the key is not in the hash table, return null
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver Code */
void main() {
  int target = 3;

  /* Hash search (array) */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // Initialize hash table
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: element, value: index
  }
  int index = hashingSearchArray(map, target);
  print('目标元素 3 的索引 = $index');

  /* Hash search (linked list) */
  ListNode? head = listToLinkedList(nums);
  // Initialize hash table
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: node value, value: node
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('目标节点值 3 的对应节点对象为 $node');
}
