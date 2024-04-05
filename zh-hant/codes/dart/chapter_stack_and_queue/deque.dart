/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 初始化雙向佇列 */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("雙向佇列 deque = $deque");

  /* 訪問元素 */
  final int peekFirst = deque.first;
  print("佇列首元素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("佇列尾元素 peekLast = $peekLast");

  /* 元素入列 */
  deque.addLast(4);
  print("元素 4 佇列尾入列後 deque = $deque");
  deque.addFirst(1);
  print("元素 1 佇列首入列後 deque = $deque");

  /* 元素出列 */
  final int popLast = deque.removeLast();
  print("佇列尾出列元素 = $popLast ，佇列尾出列後 deque = $deque");
  final int popFirst = deque.removeFirst();
  print("佇列首出列元素 = $popFirst ，佇列首出列後 deque = $deque");

  /* 獲取雙向佇列的長度 */
  final int size = deque.length;
  print("雙向佇列長度 size = $size");

  /* 判斷雙向佇列是否為空 */
  final bool isEmpty = deque.isEmpty;
  print("雙向佇列是否為空 = $isEmpty");
}
