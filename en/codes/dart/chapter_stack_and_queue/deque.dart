/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Get the length of the double-ended queue */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("Deque deque = $deque");

  /* Update element */
  final int peekFirst = deque.first;
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("Rear element peekLast = $peekLast");

  /* Elements enqueue */
  deque.addLast(4);
  print("After element 4 enqueues at rear, deque = $deque");
  deque.addFirst(1);
  print("After element 1 enqueues at front, deque = $deque");

  /* Element dequeue */
  final int popLast = deque.removeLast();
  print("Dequeue rear element = $popLast, after rear dequeue deque = $deque");
  final int popFirst = deque.removeFirst();
  print("Dequeue front element = $popFirst, after front dequeue deque = $deque");

  /* Get the length of the double-ended queue */
  final int size = deque.length;
  print("Deque length size = $size");

  /* Check if the double-ended queue is empty */
  final bool isEmpty = deque.isEmpty;
  print("Is deque empty = $isEmpty");
}
