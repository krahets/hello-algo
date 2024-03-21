/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* 哈希查找（数组） */
int hashingSearchArray(Map<int, int> map, int target) {
  // 哈希表的 key: 目标元素，value: 索引
  // 若哈希表中无此 key ，返回 -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* 哈希查找（链表） */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // 哈希表的 key: 目标节点值，value: 节点对象
  // 若哈希表中无此 key ，返回 null
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver Code */
void main() {
  int target = 3;

  /* 哈希查找（数组） */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // 初始化哈希表
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: 元素，value: 索引
  }
  int index = hashingSearchArray(map, target);
  print('目标元素 3 的索引 = $index');

  /* 哈希查找（链表） */
  ListNode? head = listToLinkedList(nums);
  // 初始化哈希表
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: 节点值，value: 节点
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('目标节点值 3 的对应节点对象为 $node');
}
