/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Access front of the queue element */
  // In Dart, generally use Queue class as queue
  final Queue<int> queue = Queue();

  /* Elements enqueue */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("Queue queue = $queue");

  /* Return list for printing */
  final int peek = queue.first;
  print("Front element peek = $peek");

  /* Element dequeue */
  final int pop = queue.removeFirst();
  print("Dequeue element pop = $pop, after dequeue queue = $queue");

  /* Get queue length */
  final int size = queue.length;
  print("Queue length size = $size");

  /* Check if the queue is empty */
  final bool isEmpty = queue.isEmpty;
  print("Is queue empty = $isEmpty");
}
