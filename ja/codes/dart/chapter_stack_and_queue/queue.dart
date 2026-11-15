/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* キューを初期化する */
  // Dart では一般に、両端キューのクラス Queue をキューとして使う
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* 要素をエンキューする */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("キュー queue = $queue");

  // [region]{peek}
  /* キューの先頭要素にアクセス */
  final int peek = queue.first;
  // [endregion]{peek}
  print("キューの先頭要素 peek = $peek");

  // [region]{pop}
  /* 要素をデキューする */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("デキューした要素 pop = $pop 、デキュー後 queue = $queue");

  // [region]{size}
  /* キューの長さを取得する */
  final int size = queue.length;
  // [endregion]{size}
  print("キューの長さ size = $size");

  // [region]{is_empty}
  /* キューが空か判定 */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("キューは空か = $isEmpty");
}
