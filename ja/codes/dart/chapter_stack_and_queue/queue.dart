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

  /* 要素をキューに追加する */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("キュー queue = $queue");

  /* キューの先頭要素を参照する */
  final int peek = queue.first;
  print("先頭要素 peek = $peek");

  /* キューから要素を取り出す */
  final int pop = queue.removeFirst();
  print("デキューした要素 pop = $pop 、デキュー後の queue = $queue");

  /* キューの要素数を取得する */
  final int size = queue.length;
  print("キューの要素数 size = $size");

  /* キューが空かどうかを判定する */
  final bool isEmpty = queue.isEmpty;
  print("キューは空か = $isEmpty");
}
