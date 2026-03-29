/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 両端キューを初期化 */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("両端キュー deque = $deque");

  /* 要素にアクセス */
  final int peekFirst = deque.first;
  print("先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("末尾要素 peekLast = $peekLast");

  /* 要素をエンキュー */
  deque.addLast(4);
  print("要素 4 を末尾にエンキューした後の deque = $deque");
  deque.addFirst(1);
  print("要素 1 を先頭にエンキューした後の deque = $deque");

  /* 要素をデキュー */
  final int popLast = deque.removeLast();
  print("末尾からデキューした要素 = $popLast ，末尾からデキュー後の deque = $deque");
  final int popFirst = deque.removeFirst();
  print("先頭からデキューした要素 = $popFirst ，先頭からデキュー後の deque = $deque");

  /* 両端キューの長さを取得 */
  final int size = deque.length;
  print("両端キューの長さ size = $size");

  /* 両端キューが空かどうかを判定 */
  final bool isEmpty = deque.isEmpty;
  print("両端キューが空かどうか = $isEmpty");
}
