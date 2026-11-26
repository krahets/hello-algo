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

  /* 要素を参照する */
  final int peekFirst = deque.first;
  print("先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("末尾要素 peekLast = $peekLast");

  /* 要素を両端キューに追加する */
  deque.addLast(4);
  print("末尾に 4 を追加した後の deque = $deque");
  deque.addFirst(1);
  print("先頭に 1 を追加した後の deque = $deque");

  /* 両端キューから要素を取り出す */
  final int popLast = deque.removeLast();
  print("末尾から取り出した要素 = $popLast 、末尾から取り出した後の deque = $deque");
  final int popFirst = deque.removeFirst();
  print("先頭から取り出した要素 = $popFirst 、先頭から取り出した後の deque = $deque");

  /* 両端キューの要素数を取得する */
  final int size = deque.length;
  print("両端キューの要素数 size = $size");

  /* 両端キューが空かどうかを判定する */
  final bool isEmpty = deque.isEmpty;
  print("両端キューは空か = $isEmpty");
}
