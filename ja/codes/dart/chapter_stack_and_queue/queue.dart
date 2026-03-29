/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* キューを初期化 */
  // Dart では、通常は両端キュー Queue をキューとして使う
  final Queue<int> queue = Queue();

  /* 要素をエンキュー */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("キュー queue = $queue");

  /* キュー先頭の要素にアクセス */
  final int peek = queue.first;
  print("先頭要素 peek = $peek");

  /* 要素をデキュー */
  final int pop = queue.removeFirst();
  print("デキューした要素 pop = $pop ，デキュー後の queue = $queue");

  /* キューの長さを取得 */
  final int size = queue.length;
  print("キューの長さ size = $size");

  /* キューが空かどうかを判定 */
  final bool isEmpty = queue.isEmpty;
  print("キューが空かどうか = $isEmpty");
}
