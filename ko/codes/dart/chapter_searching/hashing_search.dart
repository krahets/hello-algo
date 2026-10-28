/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* 해시 탐색(배열) */
int hashingSearchArray(Map<int, int> map, int target) {
  // 해시 테이블의 key: 목표 원소, value: 인덱스
  // 해시 테이블에 해당 key가 없으면 -1을 반환한다
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* 해시 탐색(연결 리스트) */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
  // 해시 테이블에 해당 key가 없으면 null을 반환한다
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* 실행 코드 */
void main() {
  int target = 3;

  /* 해시 탐색(배열) */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // 해시 테이블 초기화
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: 원소, value: 인덱스
  }
  int index = hashingSearchArray(map, target);
  print('목표 원소 3의 인덱스 = $index');

  /* 해시 탐색(연결 리스트) */
  ListNode? head = listToLinkedList(nums);
  // 해시 테이블 초기화
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: 노드 값, value: 노드
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('목표 노드 값 3에 해당하는 노드 객체 = $node');
}
