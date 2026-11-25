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
  print("deque = $deque");

  /* Peek at the front and rear elements */
  final int peekFirst = deque.first;
  print("Front element (peekFirst) = $peekFirst");
  final int peekLast = deque.last;
  print("Rear element (peekLast) = $peekLast");

  /* Add elements to the deque */
  deque.addLast(4);
  print("After adding 4 at the rear, deque = $deque");
  deque.addFirst(1);
  print("After adding 1 at the front, deque = $deque");

  /* Remove elements from both ends */
  final int popLast = deque.removeLast();
  print("Removed from the rear = $popLast, deque after removal = $deque");
  final int popFirst = deque.removeFirst();
  print("Removed from the front = $popFirst, deque after removal = $deque");

  /* Get the deque size */
  final int size = deque.length;
  print("Deque size = $size");

  /* Check whether the deque is empty */
  final bool isEmpty = deque.isEmpty;
  print("Deque is empty = $isEmpty");
}
