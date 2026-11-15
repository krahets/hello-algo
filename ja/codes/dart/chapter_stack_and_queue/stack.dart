/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* スタックを初期化する */
  // Dart には組み込みのスタッククラスがないため、List をスタックとして使える
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* 要素をプッシュする */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("スタック stack = $stack");

  // [region]{peek}
  /* スタックの先頭要素にアクセスする */
  final int peek = stack.last;
  // [endregion]{peek}
  print("スタックの先頭要素 peek = $peek");

  // [region]{pop}
  /* 要素をポップする */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("ポップした要素 pop = $pop 、ポップ後 stack = $stack");

  // [region]{size}
  /* スタックの長さを取得する */
  final int size = stack.length;
  // [endregion]{size}
  print("スタックの長さ size = $size");

  // [region]{is_empty}
  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("スタックは空か = $isEmpty");
}
