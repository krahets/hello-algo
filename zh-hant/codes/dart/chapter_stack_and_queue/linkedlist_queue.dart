/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
  ListNode? _front; // 頭節點 _front
  ListNode? _rear; // 尾節點 _rear
  int _queSize = 0; // 佇列長度

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* 獲取佇列的長度 */
  int size() {
    return _queSize;
  }

  /* 判斷佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入列 */
  void push(int _num) {
    // 在尾節點後新增 _num
    final node = ListNode(_num);
    // 如果佇列為空，則令頭、尾節點都指向該節點
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // 如果佇列不為空，則將該節點新增到尾節點後
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* 出列 */
  int pop() {
    final int _num = peek();
    // 刪除頭節點
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* 訪問佇列首元素 */
  int peek() {
    if (_queSize == 0) {
      throw Exception('佇列為空');
    }
    return _front!.val;
  }

  /* 將鏈結串列轉化為 Array 並返回 */
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
  /* 初始化佇列 */
  final queue = LinkedListQueue();

  /* 元素入列 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("佇列 queue = ${queue.toArray()}");

  /* 訪問佇列首元素 */
  final int peek = queue.peek();
  print("佇列首元素 peek = $peek");

  /* 元素出列 */
  final int pop = queue.pop();
  print("出列元素 pop = $pop ，出列後 queue = ${queue.toArray()}");

  /* 獲取佇列的長度 */
  final int size = queue.size();
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty();
  print("佇列是否為空 = $isEmpty");
}
