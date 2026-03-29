/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* スタックを初期化 */
  // Dart には組み込みのスタッククラスがないため、List をスタックとして使える
  final List<int> stack = [];

  /* 要素をプッシュ */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("スタック stack = $stack");

  /* スタックトップの要素にアクセス */
  final int peek = stack.last;
  print("スタックトップの要素 peek = $peek");

  /* 要素をポップ */
  final int pop = stack.removeLast();
  print("ポップした要素 pop = $pop ，ポップ後の stack = $stack");

  /* スタックの長さを取得 */
  final int size = stack.length;
  print("スタックの長さ size = $size");

  /* 空かどうかを判定 */
  final bool isEmpty = stack.isEmpty;
  print("スタックが空かどうか = $isEmpty");
}
