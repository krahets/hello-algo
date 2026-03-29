/**
 * File: hashing_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';
import '../utils/list_node.dart';

/* ハッシュ探索（配列） */
int hashingSearchArray(Map<int, int> map, int target) {
  // ハッシュテーブルの key: 目標要素、value: インデックス
  // ハッシュテーブルにこの key がなければ -1 を返す
  if (!map.containsKey(target)) {
    return -1;
  }
  return map[target]!;
}

/* ハッシュ探索（連結リスト） */
ListNode? hashingSearchLinkedList(Map<int, ListNode> map, int target) {
  // ハッシュテーブルの key: 目標ノード値、value: ノードオブジェクト
  // ハッシュテーブルにこの key がなければ null を返す
  if (!map.containsKey(target)) {
    return null;
  }
  return map[target]!;
}

/* Driver Code */
void main() {
  int target = 3;

  /* ハッシュ探索（配列） */
  List<int> nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
  // ハッシュテーブルを初期化
  Map<int, int> map = HashMap();
  for (int i = 0; i < nums.length; i++) {
    map.putIfAbsent(nums[i], () => i); // key: 要素、value: インデックス
  }
  int index = hashingSearchArray(map, target);
  print('対象要素 3 のインデックス = $index');

  /* ハッシュ探索（連結リスト） */
  ListNode? head = listToLinkedList(nums);
  // ハッシュテーブルを初期化
  Map<int, ListNode> map1 = HashMap();
  while (head != null) {
    map1.putIfAbsent(head.val, () => head!); // key: ノード値、value: ノード
    head = head.next;
  }
  ListNode? node = hashingSearchLinkedList(map1, target);
  print('目標ノード値 3 に対応するノードオブジェクトは $node です');
}
