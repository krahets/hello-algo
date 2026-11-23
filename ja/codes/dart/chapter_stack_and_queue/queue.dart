/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* キューを初期化する */
  // Dart では一般に、両端キューのクラス Queue をキューとして使う
  final Queue<int> queue = Queue();

  /* 要素をエンキューする */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("キュー queue = $queue");

  /* キューの先頭要素にアクセス */
  final int peek = queue.first;
  print("キューの先頭要素 peek = $peek");

  /* 要素をデキューする */
  final int pop = queue.removeFirst();
  print("デキューした要素 pop = $pop 、デキュー後 queue = $queue");

  /* キューの長さを取得する */
  final int size = queue.length;
  print("キューの長さ size = $size");

  /* キューが空か判定 */
  final bool isEmpty = queue.isEmpty;
  print("キューは空か = $isEmpty");
}
