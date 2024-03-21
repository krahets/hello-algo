/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 初始化双向队列 */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("双向队列 deque = $deque");

  /* 访问元素 */
  final int peekFirst = deque.first;
  print("队首元素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("队尾元素 peekLast = $peekLast");

  /* 元素入队 */
  deque.addLast(4);
  print("元素 4 队尾入队后 deque = $deque");
  deque.addFirst(1);
  print("元素 1 队首入队后 deque = $deque");

  /* 元素出队 */
  final int popLast = deque.removeLast();
  print("队尾出队元素 = $popLast ，队尾出队后 deque = $deque");
  final int popFirst = deque.removeFirst();
  print("队首出队元素 = $popFirst ，队首出队后 deque = $deque");

  /* 获取双向队列的长度 */
  final int size = deque.length;
  print("双向队列长度 size = $size");

  /* 判断双向队列是否为空 */
  final bool isEmpty = deque.isEmpty;
  print("双向队列是否为空 = $isEmpty");
}
