/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 初始化雙端佇列 */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("雙端佇列 deque = $deque");

  /* 讀取隊首與隊尾元素 */
  final int peekFirst = deque.first;
  print("隊首元素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("隊尾元素 peekLast = $peekLast");

  /* 將元素加入雙端佇列 */
  deque.addLast(4);
  print("將元素 4 加到隊尾後 deque = $deque");
  deque.addFirst(1);
  print("將元素 1 加到隊首後 deque = $deque");

  /* 從雙端佇列取出元素 */
  final int popLast = deque.removeLast();
  print("從隊尾取出的元素 = $popLast ，取出後 deque = $deque");
  final int popFirst = deque.removeFirst();
  print("從隊首取出的元素 = $popFirst ，取出後 deque = $deque");

  /* 取得雙端佇列長度 */
  final int size = deque.length;
  print("雙端佇列長度 size = $size");

  /* 判斷雙端佇列是否為空 */
  final bool isEmpty = deque.isEmpty;
  print("雙端佇列是否為空 = $isEmpty");
}
