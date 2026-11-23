/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 両端キューを初期化する */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("両端キュー deque = $deque");

  /* 要素にアクセスする */
  final int peekFirst = deque.first;
  print("キューの先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("キューの末尾要素 peekLast = $peekLast");

  /* 要素をエンキューする */
  deque.addLast(4);
  print("要素 4 を末尾にエンキューした後 deque = $deque");
  deque.addFirst(1);
  print("要素 1 を先頭にエンキューした後 deque = $deque");

  /* 要素をデキューする */
  final int popLast = deque.removeLast();
  print("末尾からデキューした要素 = $popLast 、末尾からデキューした後 deque = $deque");
  final int popFirst = deque.removeFirst();
  print("先頭からデキューした要素 = $popFirst 、先頭からデキューした後 deque = $deque");

  /* 両端キューの長さを取得する */
  final int size = deque.length;
  print("両端キューの長さ size = $size");

  /* 両端キューが空かどうかを判定する */
  final bool isEmpty = deque.isEmpty;
  print("両端キューは空か = $isEmpty");
}
