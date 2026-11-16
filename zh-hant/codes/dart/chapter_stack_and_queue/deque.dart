/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* 初始化雙向佇列 */
  // 在 Dart 中，Queue 被定義為雙向佇列
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* 元素入列 */
  deque.addLast(2); // 新增至佇列尾
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // 新增至佇列首
  deque.addFirst(1);
  // [endregion]{push}
  print("雙向佇列 deque = $deque");

  // [region]{peek_first}
  /* 訪問元素 */
  final int peekFirst = deque.first; // 佇列首元素
  // [endregion]{peek_first}
  print("佇列首元素 peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // 佇列尾元素
  // [endregion]{peek_last}
  print("佇列尾元素 peekLast = $peekLast");

  // [region]{pop_first}
  /* 元素出列 */
  final int popFirst = deque.removeFirst(); // 佇列首元素出列
  // [endregion]{pop_first}
  print("佇列首出列元素 = $popFirst ，佇列首出列後 deque = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // 佇列尾元素出列
  // [endregion]{pop_last}
  print("佇列尾出列元素 = $popLast ，佇列尾出列後 deque = $deque");

  // [region]{size}
  /* 獲取雙向佇列的長度 */
  final int size = deque.length;
  // [endregion]{size}
  print("雙向佇列長度 size = $size");

  // [region]{is_empty}
  /* 判斷雙向佇列是否為空 */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("雙向佇列是否為空 = $isEmpty");
}
