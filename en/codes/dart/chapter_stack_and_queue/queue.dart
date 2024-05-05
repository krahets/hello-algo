/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Initialize queue */
  // In Dart, the Queue class is generally used as a queue
  final Queue<int> queue = Queue();

  /* Element enqueue */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("Queue queue = $queue");

  /* Access front element */
  final int peek = queue.first;
  print("Front element peek = $peek");

  /* Element dequeue */
  final int pop = queue.removeFirst();
  print("Dequeue element pop = $pop, queue after dequeue = $queue");

  /* Get queue length */
  final int size = queue.length;
  print("Queue length size = $size");

  /* Determine if the queue is empty */
  final bool isEmpty = queue.isEmpty;
  print("Is the queue empty = $isEmpty");
}
