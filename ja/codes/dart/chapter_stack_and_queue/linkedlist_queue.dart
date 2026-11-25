/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 連結リストを使ったキュー */
class LinkedListQueue {
  ListNode? _front; // 先頭ノード _front
  ListNode? _rear; // 末尾ノード _rear
  int _queSize = 0; // キューの要素数

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* キューの要素数を取得する */
  int size() {
    return _queSize;
  }

  /* キューが空かどうかを判定する */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* エンキューする */
  void push(int _num) {
    // 値が _num のノードを末尾ノードの後ろに追加する
    final node = ListNode(_num);
    // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* デキューする */
  int pop() {
    final int _num = peek();
    // 先頭ノードを削除する
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* キューの先頭要素を参照する */
  int peek() {
    if (_queSize == 0) {
      throw Exception('キューが空です');
    }
    return _front!.val;
  }

  /* 連結リストを List に変換して返す */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> queue = [];
    while (node != null) {
      queue.add(node.val);
      node = node.next;
    }
    return queue;
  }
}

/* 実行例 */
void main() {
  /* キューを初期化する */
  final queue = LinkedListQueue();

  /* 要素をキューに追加する */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("キュー queue = ${queue.toArray()}");

  /* キューの先頭要素を参照する */
  final int peek = queue.peek();
  print("先頭要素 peek = $peek");

  /* キューから要素を取り出す */
  final int pop = queue.pop();
  print("デキューした要素 pop = $pop 、デキュー後の queue = ${queue.toArray()}");

  /* キューの要素数を取得する */
  final int size = queue.size();
  print("キューの要素数 size = $size");

  /* キューが空かどうかを判定する */
  final bool isEmpty = queue.isEmpty();
  print("キューは空か = $isEmpty");
}
