/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 配列で実装したスタック */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* スタックの長さを取得する */
  int size() {
    return _stack.length;
  }

  /* スタックが空かどうかを判定する */
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

  /* スタックの先頭要素にアクセスする */
  int peek() {
    if (isEmpty()) {
      throw Exception("スタックが空です");
    }
    return _stack.last;
  }

  /* スタックを Array に変換して返す */
  List<int> toArray() => _stack;
}

/* 実行用コード */
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

  /* スタックの先頭要素にアクセスする */
  final int peek = stack.peek();
  print("スタックの先頭要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.pop();
  print("ポップした要素 pop = $pop 、ポップ後 stack = ${stack.toArray()}");

  /* スタックの長さを取得する */
  final int size = stack.size();
  print("スタックの長さ size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty();
  print("スタックは空か = $isEmpty");
}
