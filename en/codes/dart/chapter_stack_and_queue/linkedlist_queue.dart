/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Queue backed by a linked list */
class LinkedListQueue {
  ListNode? _front; // Head node (_front)
  ListNode? _rear; // Tail node (_rear)
  int _queSize = 0; // Queue size

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* Get the queue size */
  int size() {
    return _queSize;
  }

  /* Check whether the queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Enqueue an element */
  void push(int _num) {
    // Add a node containing _num after the tail
    final node = ListNode(_num);
    // If the queue is empty, point both the head and tail at the new node
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // If the queue has elements, link the new node after the tail
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* Remove and return the front element */
  int pop() {
    final int _num = peek();
    // Remove the head node
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* Peek at the front element */
  int peek() {
    if (_queSize == 0) {
      throw Exception('Queue is empty');
    }
    return _front!.val;
  }

  /* Return the linked list values as a List */
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

/* Driver code */
void main() {
  /* Initialize the queue */
  final queue = LinkedListQueue();

  /* Enqueue elements */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("queue = ${queue.toArray()}");

  /* Peek at the front element */
  final int peek = queue.peek();
  print("Front element (peek) = $peek");

  /* Dequeue an element */
  final int pop = queue.pop();
  print("Dequeued element (pop) = $pop, queue after removal = ${queue.toArray()}");

  /* Get the queue size */
  final int size = queue.size();
  print("Queue size = $size");

  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Queue is empty = $isEmpty");
}
