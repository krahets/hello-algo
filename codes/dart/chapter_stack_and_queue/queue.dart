/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* 初始化队列 */
  // 在 Dart 中，一般将双向队列类 Queue 看作队列使用
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* 元素入队 */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("队列 queue = $queue");

  // [region]{peek}
  /* 访问队首元素 */
  final int peek = queue.first;
  // [endregion]{peek}
  print("队首元素 peek = $peek");

  // [region]{pop}
  /* 元素出队 */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("出队元素 pop = $pop ，出队后 queue = $queue");

  // [region]{size}
  /* 获取队列长度 */
  final int size = queue.length;
  // [endregion]{size}
  print("队列长度 size = $size");

  // [region]{is_empty}
  /* 判断队列是否为空 */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("队列是否为空 = $isEmpty");
}
