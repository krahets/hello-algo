/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 連結リストのクラスを使ったスタック */
class LinkedListStack {
  ListNode? _stackPeek; // 先頭ノードをスタックのトップとする
  int _stkSize = 0; // スタックの要素数

  LinkedListStack() {
    _stackPeek = null;
  }

  /* スタックの要素数を取得する */
  int size() {
    return _stkSize;
  }

  /* スタックが空かどうかを判定する */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* プッシュする */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* ポップする */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* スタックのトップを参照する */
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

/* 実行例 */
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

  /* スタックのトップを参照する */
  final int peek = stack.peek();
  print("スタックのトップの要素 peek = $peek");

  /* 要素をポップする */
  final int pop = stack.pop();
  print("ポップした要素 pop = $pop 、ポップ後の stack = ${stack.toList()}");

  /* スタックの要素数を取得する */
  final int size = stack.size();
  print("スタックの要素数 size = $size");

  /* 空かどうかを判定する */
  final bool isEmpty = stack.isEmpty();
  print("スタックは空か = $isEmpty");
}
