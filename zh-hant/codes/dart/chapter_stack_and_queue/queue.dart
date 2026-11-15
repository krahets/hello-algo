/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 初始化佇列 */
  // 在 Dart 中，一般將雙向佇列類別 Queue 看作佇列使用
  final Queue<int> queue = Queue();

  /* 元素入列 */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("佇列 queue = $queue");

  /* 訪問佇列首元素 */
  final int peek = queue.first;
  print("佇列首元素 peek = $peek");

  /* 元素出列 */
  final int pop = queue.removeFirst();
  print("出列元素 pop = $pop ，出列後 queue = $queue");

  /* 獲取佇列長度 */
  final int size = queue.length;
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty;
  print("佇列是否為空 = $isEmpty");
}
