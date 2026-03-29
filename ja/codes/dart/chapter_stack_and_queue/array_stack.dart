/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 配列ベースのスタック */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* スタックの長さを取得 */
  int size() {
    return _stack.length;
  }

  /* スタックが空かどうかを判定 */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* プッシュ */
  void push(int _num) {
    _stack.add(_num);
  }

  /* ポップ */
  int pop() {
    if (isEmpty()) {
      throw Exception("スタックが空です");
    }
    return _stack.removeLast();
  }

  /* スタックトップの要素にアクセス */
  int peek() {
    if (isEmpty()) {
      throw Exception("スタックが空です");
    }
    return _stack.last;
  }

  /* スタックを Array に変換して返す */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* スタックを初期化 */
  final ArrayStack stack = ArrayStack();

  /* 要素をプッシュ */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("スタック stack = ${stack.toArray()}");

  /* スタックトップの要素にアクセス */
  final int peek = stack.peek();
  print("スタックトップの要素 peek = $peek");

  /* 要素をポップ */
  final int pop = stack.pop();
  print("ポップした要素 pop = $pop ，ポップ後の stack = ${stack.toArray()}");

  /* スタックの長さを取得 */
  final int size = stack.size();
  print("スタックの長さ size = $size");

  /* 空かどうかを判定 */
  final bool isEmpty = stack.isEmpty();
  print("スタックが空かどうか = $isEmpty");
}
