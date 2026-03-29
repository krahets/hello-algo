/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 連結リストベースのキュー */
class LinkedListQueue {
  ListNode? _front; // 先頭ノード _front
  ListNode? _rear; // 末尾ノード _rear
  int _queSize = 0; // キューの長さ

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* キューの長さを取得 */
  int size() {
    return _queSize;
  }

  /* キューが空かどうかを判定 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* エンキュー */
  void push(int _num) {
    // 末尾ノードの後ろに _num を追加
    final node = ListNode(_num);
    // キューが空なら、先頭・末尾ノードをともにそのノードに設定
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // キューが空でなければ、そのノードを末尾ノードの後ろに追加
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* デキュー */
  int pop() {
    final int _num = peek();
    // 先頭ノードを削除
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* キュー先頭の要素にアクセス */
  int peek() {
    if (_queSize == 0) {
      throw Exception('キューが空です');
    }
    return _front!.val;
  }

  /* 連結リストを Array に変換して返す */
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

/* Driver Code */
void main() {
  /* キューを初期化 */
  final queue = LinkedListQueue();

  /* 要素をエンキュー */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("キュー queue = ${queue.toArray()}");

  /* キュー先頭の要素にアクセス */
  final int peek = queue.peek();
  print("先頭要素 peek = $peek");

  /* 要素をデキュー */
  final int pop = queue.pop();
  print("デキューした要素 pop = $pop ，デキュー後の queue = ${queue.toArray()}");

  /* キューの長さを取得 */
  final int size = queue.size();
  print("キューの長さ size = $size");

  /* キューが空かどうかを判定 */
  final bool isEmpty = queue.isEmpty();
  print("キューが空かどうか = $isEmpty");
}
