/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* スタックを初期化する */
  // Dart には組み込みのスタッククラスがないため、List をスタックとして使える
  final List<int> stack = [];

  /* 要素をプッシュする */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("スタック stack = $stack");

  /* スタックの先頭要素にアクセスする */
  final int peek = stack.last;
  print("スタックの先頭要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.removeLast();
  print("ポップした要素 pop = $pop 、ポップ後 stack = $stack");

  /* スタックの長さを取得する */
  final int size = stack.length;
  print("スタックの長さ size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty;
  print("スタックは空か = $isEmpty");
}
