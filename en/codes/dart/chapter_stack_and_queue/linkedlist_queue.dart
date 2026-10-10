/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Queue based on linked list implementation */
class LinkedListQueue {
  ListNode? _front; // Head node _front
  ListNode? _rear; // Tail node _rear
  int _queSize = 0; // Queue length

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* Get the length of the queue */
  int size() {
    return _queSize;
  }

  /* Check if the queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Enqueue */
  void push(int _num) {
    // Add _num after tail node
    final node = ListNode(_num);
    // If the queue is empty, make both front and rear point to the node
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // If the queue is not empty, add the node after the tail node
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* Dequeue */
  int pop() {
    final int _num = peek();
    // Delete head node
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* Return list for printing */
  int peek() {
    if (_queSize == 0) {
      throw Exception('Queue is empty');
    }
    return _front!.val;
  }

  /* Convert linked list to Array and return */
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
  /* Access front of the queue element */
  final queue = LinkedListQueue();

  /* Elements enqueue */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Queue queue = ${queue.toArray()}");

  /* Return list for printing */
  final int peek = queue.peek();
  print("Front element peek = $peek");

  /* Element dequeue */
  final int pop = queue.pop();
  print("Dequeue element pop = $pop, after dequeue queue = ${queue.toArray()}");

  /* Get the length of the queue */
  final int size = queue.size();
  print("Queue length size = $size");

  /* Check if the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Is queue empty = $isEmpty");
}
