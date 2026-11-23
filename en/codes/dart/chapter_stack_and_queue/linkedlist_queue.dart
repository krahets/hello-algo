/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Queue implemented with a linked list */
class LinkedListQueue {
  ListNode? _front; // Head node _front
  ListNode? _rear; // Tail node _rear
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

  /* Enqueue */
  void push(int _num) {
    // Add _num after the tail node
    final node = ListNode(_num);
    // If the queue is empty, make both the head and tail point to this node
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // If the queue is not empty, add this node after the tail node
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* Dequeue */
  int pop() {
    final int _num = peek();
    // Remove the head node
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* Access the front element */
  int peek() {
    if (_queSize == 0) {
      throw Exception('Queue is empty');
    }
    return _front!.val;
  }

  /* Convert the linked list to an array and return it */
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
  print("Queue queue = ${queue.toArray()}");

  /* Access the front element */
  final int peek = queue.peek();
  print("Front element peek = $peek");

  /* Dequeue an element */
  final int pop = queue.pop();
  print("Dequeued element pop = $pop; after dequeuing, queue = ${queue.toArray()}");

  /* Get the queue size */
  final int size = queue.size();
  print("Queue size = $size");

  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Is the queue empty = $isEmpty");
}
