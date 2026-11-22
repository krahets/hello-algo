/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Initialize the deque */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("Deque deque = $deque");

  /* Access an element */
  final int peekFirst = deque.first;
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("Rear element peekLast = $peekLast");

  /* Enqueue elements */
  deque.addLast(4);
  print("After enqueuing 4 at the rear, deque = $deque");
  deque.addFirst(1);
  print("After enqueuing 1 at the front, deque = $deque");

  /* Dequeue an element */
  final int popLast = deque.removeLast();
  print("Element dequeued from the rear = $popLast; after dequeuing from the rear, deque = $deque");
  final int popFirst = deque.removeFirst();
  print("Element dequeued from the front = $popFirst; after dequeuing from the front, deque = $deque");

  /* Get the deque size */
  final int size = deque.length;
  print("Deque size = $size");

  /* Check whether the deque is empty */
  final bool isEmpty = deque.isEmpty;
  print("Is the deque empty = $isEmpty");
}
