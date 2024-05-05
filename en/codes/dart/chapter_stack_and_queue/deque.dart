/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Initialize double-ended queue */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("Double-ended queue deque = $deque");

  /* Access element */
  final int peekFirst = deque.first;
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("Back element peekLast = $peekLast");

  /* Element enqueue */
  deque.addLast(4);
  print("Element 4 enqueued at the back, deque = $deque");
  deque.addFirst(1);
  print("Element 1 enqueued at the front, deque = $deque");

  /* Element dequeue */
  final int popLast = deque.removeLast();
  print("Back dequeue element = $popLast, deque after back dequeue = $deque");
  final int popFirst = deque.removeFirst();
  print("Front dequeue element = $popFirst, deque after front dequeue = $deque");

  /* Get the length of the double-ended queue */
  final int size = deque.length;
  print("Double-ended queue length size = $size");

  /* Determine if the double-ended queue is empty */
  final bool isEmpty = deque.isEmpty;
  print("Is the double-ended queue empty = $isEmpty");
}
