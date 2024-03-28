/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* 雜湊查詢（陣列） */
int hashingSearchArray(Map<int, int> map, int target) {
  // 雜湊表的 key: 目標元素，value: 索引
  // 若雜湊表中無此 key ，返回 -1
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* 雜湊查詢（鏈結串列） */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // 雜湊表的 key: 目標節點值，value: 節點物件
  // 若雜湊表中無此 key ，返回 null
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver Code */
void main() {
  int target = 3;

  /* 雜湊查詢（陣列） */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // 初始化雜湊表
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: 元素，value: 索引
  }
  int index = hashingSearchArray(map, target);
  print('目標元素 3 的索引 = $index');

  /* 雜湊查詢（鏈結串列） */
  ListNode? head = listToLinkedList(nums);
  // 初始化雜湊表
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: 節點值，value: 節點
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('目標節點值 3 的對應節點物件為 $node');
}
