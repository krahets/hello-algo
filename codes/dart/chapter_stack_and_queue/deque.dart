/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* 初始化双向队列 */
  // 在 Dart 中，Queue 被定义为双向队列
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* 元素入队 */
  deque.addLast(2); // 添加至队尾
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // 添加至队首
  deque.addFirst(1);
  // [endregion]{push}
  print("双向队列 deque = $deque");

  // [region]{peek_first}
  /* 访问元素 */
  final int peekFirst = deque.first; // 队首元素
  // [endregion]{peek_first}
  print("队首元素 peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // 队尾元素
  // [endregion]{peek_last}
  print("队尾元素 peekLast = $peekLast");

  // [region]{pop_first}
  /* 元素出队 */
  final int popFirst = deque.removeFirst(); // 队首元素出队
  // [endregion]{pop_first}
  print("队首出队元素 = $popFirst ，队首出队后 deque = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // 队尾元素出队
  // [endregion]{pop_last}
  print("队尾出队元素 = $popLast ，队尾出队后 deque = $deque");

  // [region]{size}
  /* 获取双向队列的长度 */
  final int size = deque.length;
  // [endregion]{size}
  print("双向队列长度 size = $size");

  // [region]{is_empty}
  /* 判断双向队列是否为空 */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("双向队列是否为空 = $isEmpty");
}
