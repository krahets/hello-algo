/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
  ListNode? _front; // _front 指向首節點
  ListNode? _rear; // _rear 指向尾節點
  int _queSize = 0; // 佇列長度

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* 取得佇列長度 */
  int size() {
    return _queSize;
  }

  /* 判斷佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入隊 */
  void push(int _num) {
    // 建立存有 _num 的新節點，準備接到隊尾
    final node = ListNode(_num);
    // 若佇列為空，讓隊首與隊尾都指向新節點
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // 若佇列非空，將新節點接在尾節點之後
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* 出隊 */
  int pop() {
    final int _num = peek();
    // 移除首節點
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* 讀取隊首元素 */
  int peek() {
    if (_queSize == 0) {
      throw Exception('佇列為空');
    }
    return _front!.val;
  }

  /* 將鏈結串列轉成 List 並回傳 */
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

/* 範例程式 */
void main() {
  /* 初始化佇列 */
  final queue = LinkedListQueue();

  /* 將元素加入佇列 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("佇列 queue = ${queue.toArray()}");

  /* 讀取隊首元素 */
  final int peek = queue.peek();
  print("隊首元素 peek = $peek");

  /* 從佇列取出元素 */
  final int pop = queue.pop();
  print("出隊元素 pop = $pop ，出隊後 queue = ${queue.toArray()}");

  /* 取得佇列長度 */
  final int size = queue.size();
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty();
  print("佇列是否為空 = $isEmpty");
}
