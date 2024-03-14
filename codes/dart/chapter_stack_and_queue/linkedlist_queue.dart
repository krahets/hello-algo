/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 基于链表实现的队列 */
class LinkedListQueue {
  ListNode? _front; // 头节点 _front
  ListNode? _rear; // 尾节点 _rear
  int _queSize = 0; // 队列长度

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* 获取队列的长度 */
  int size() {
    return _queSize;
  }

  /* 判断队列是否为空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入队 */
  void push(int _num) {
    // 在尾节点后添加 _num
    final node = ListNode(_num);
    // 如果队列为空，则令头、尾节点都指向该节点
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // 如果队列不为空，则将该节点添加到尾节点后
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* 出队 */
  int pop() {
    final int _num = peek();
    // 删除头节点
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* 访问队首元素 */
  int peek() {
    if (_queSize == 0) {
      throw Exception('队列为空');
    }
    return _front!.val;
  }

  /* 将链表转化为 Array 并返回 */
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
  /* 初始化队列 */
  final queue = LinkedListQueue();

  /* 元素入队 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("队列 queue = ${queue.toArray()}");

  /* 访问队首元素 */
  final int peek = queue.peek();
  print("队首元素 peek = $peek");

  /* 元素出队 */
  final int pop = queue.pop();
  print("出队元素 pop = $pop ，出队后 queue = ${queue.toArray()}");

  /* 获取队列的长度 */
  final int size = queue.size();
  print("队列长度 size = $size");

  /* 判断队列是否为空 */
  final bool isEmpty = queue.isEmpty();
  print("队列是否为空 = $isEmpty");
}
