/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 配列を使ったスタック */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* スタックの要素数を取得する */
  int size() {
    return _stack.length;
  }

  /* スタックが空かどうかを判定する */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* プッシュする */
  void push(int _num) {
    _stack.add(_num);
  }

  /* ポップする */
  int pop() {
    if (isEmpty()) {
      throw Exception("スタックが空です");
    }
    return _stack.removeLast();
  }

  /* スタックのトップを参照する */
  int peek() {
    if (isEmpty()) {
      throw Exception("スタックが空です");
    }
    return _stack.last;
  }

  /* スタックの要素を格納した List を返す */
  List<int> toArray() => _stack;
}

/* 実行例 */
void main() {
  /* スタックを初期化する */
  final ArrayStack stack = ArrayStack();

  /* 要素をプッシュする */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("スタック stack = ${stack.toArray()}");

  /* スタックのトップを参照する */
  final int peek = stack.peek();
  print("スタックのトップの要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.pop();
  print("ポップした要素 pop = $pop 、ポップ後の stack = ${stack.toArray()}");

  /* スタックの要素数を取得する */
  final int size = stack.size();
  print("スタックの要素数 size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty();
  print("スタックは空か = $isEmpty");
}
