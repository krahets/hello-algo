/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* 배열에서의 해시 탐색 */
int hashingSearchArray(Map<int, int> map, int target) {
  // 해시 테이블의 key는 목표 원소, value는 인덱스다.
  // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* 연결 리스트에서의 해시 탐색 */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
  // 해시 테이블에 해당 키가 없으면 null을 반환한다.
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* 실행 예제 */
void main() {
  int target = 3;

  /* 배열에서의 해시 탐색 */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // 해시 테이블 초기화
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key는 원소, value는 인덱스다.
  }
  int index = hashingSearchArray(map, target);
  print('목표 원소 3의 인덱스 = $index');

  /* 연결 리스트에서의 해시 탐색 */
  ListNode? head = listToLinkedList(nums);
  // 해시 테이블 초기화
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key는 노드의 값, value는 노드다.
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('값이 3인 목표 노드의 객체 = $node');
}
