/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 初始化佇列 */
  // 在 Dart 中，通常用雙端佇列類別 Queue 當作一般佇列
  final Queue<int> queue = Queue();

  /* 將元素加入佇列 */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("佇列 queue = $queue");

  /* 讀取隊首元素 */
  final int peek = queue.first;
  print("隊首元素 peek = $peek");

  /* 從佇列取出元素 */
  final int pop = queue.removeFirst();
  print("出隊元素 pop = $pop ，出隊後 queue = $queue");

  /* 取得佇列長度 */
  final int size = queue.length;
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty;
  print("佇列是否為空 = $isEmpty");
}
