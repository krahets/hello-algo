/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 連結リストクラスで実装したスタック */
class LinkedListStack {
  ListNode? _stackPeek; // 先頭ノードをスタックの先頭とする
  int _stkSize = 0; // スタックの長さ

  LinkedListStack() {
    _stackPeek = null;
  }

  /* スタックの長さを取得する */
  int size() {
    return _stkSize;
  }

  /* スタックが空かどうかを判定する */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* プッシュ */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* ポップ */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* スタックの先頭要素にアクセスする */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("スタックが空です");
    }
    return _stackPeek!.val;
  }

  /* 連結リストを List に変換して返す */
  List<int> toList() {
    ListNode? node = _stackPeek;
    List<int> list = [];
    while (node != null) {
      list.add(node.val);
      node = node.next;
    }
    list = list.reversed.toList();
    return list;
  }
}

/* 実行用コード */
void main() {
  /* スタックを初期化する */
  final LinkedListStack stack = LinkedListStack();

  /* 要素をプッシュする */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("スタック stack = ${stack.toList()}");

  /* スタックの先頭要素にアクセスする */
  final int peek = stack.peek();
  print("スタックの先頭要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.pop();
  print("ポップした要素 pop = $pop 、ポップ後 stack = ${stack.toList()}");

  /* スタックの長さを取得する */
  final int size = stack.size();
  print("スタックの長さ size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty();
  print("スタックは空か = $isEmpty");
}
