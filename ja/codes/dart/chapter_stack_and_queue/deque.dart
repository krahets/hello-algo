/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* 両端キューを初期化する */
  // Dart では、Queue は両端キューとして定義されている
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* 要素をエンキューする */
  deque.addLast(2); // キューの末尾に追加する
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // キューの先頭に追加する
  deque.addFirst(1);
  // [endregion]{push}
  print("両端キュー deque = $deque");

  // [region]{peek_first}
  /* 要素にアクセスする */
  final int peekFirst = deque.first; // キューの先頭要素
  // [endregion]{peek_first}
  print("キューの先頭要素 peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // キューの末尾要素
  // [endregion]{peek_last}
  print("キューの末尾要素 peekLast = $peekLast");

  // [region]{pop_first}
  /* 要素をデキューする */
  final int popFirst = deque.removeFirst(); // キューの先頭要素をデキューする
  // [endregion]{pop_first}
  print("先頭からデキューした要素 = $popFirst 、先頭からデキューした後 deque = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // キューの末尾要素をデキューする
  // [endregion]{pop_last}
  print("末尾からデキューした要素 = $popLast 、末尾からデキューした後 deque = $deque");

  // [region]{size}
  /* 両端キューの長さを取得する */
  final int size = deque.length;
  // [endregion]{size}
  print("両端キューの長さ size = $size");

  // [region]{is_empty}
  /* 両端キューが空かどうかを判定する */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("両端キューは空か = $isEmpty");
}
