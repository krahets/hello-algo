/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* スタックを初期化する */
  // Dart には組み込みのスタッククラスがないので、List をスタックとして使える
  final List<int> stack = [];

  /* 要素をプッシュする */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("スタック stack = $stack");

  /* スタックのトップを参照する */
  final int peek = stack.last;
  print("スタックのトップの要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.removeLast();
  print("ポップした要素 pop = $pop 、ポップ後の stack = $stack");

  /* スタックの要素数を取得する */
  final int size = stack.length;
  print("スタックの要素数 size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty;
  print("スタックは空か = $isEmpty");
}
