/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* 初始化佇列 */
  // 在 Dart 中，一般將雙向佇列類別 Queue 看作佇列使用
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* 元素入列 */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("佇列 queue = $queue");

  // [region]{peek}
  /* 訪問佇列首元素 */
  final int peek = queue.first;
  // [endregion]{peek}
  print("佇列首元素 peek = $peek");

  // [region]{pop}
  /* 元素出列 */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("出列元素 pop = $pop ，出列後 queue = $queue");

  // [region]{size}
  /* 獲取佇列長度 */
  final int size = queue.length;
  // [endregion]{size}
  print("佇列長度 size = $size");

  // [region]{is_empty}
  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("佇列是否為空 = $isEmpty");
}
