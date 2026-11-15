/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Initialize the queue */
  // In Dart, the deque class Queue is commonly used as a queue
  final Queue<int> queue = Queue();

  /* Enqueue elements */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("Queue queue = $queue");

  /* Access the front element */
  final int peek = queue.first;
  print("Front element peek = $peek");

  /* Dequeue an element */
  final int pop = queue.removeFirst();
  print("Dequeued element pop = $pop; after dequeuing, queue = $queue");

  /* Get the queue size */
  final int size = queue.length;
  print("Queue size = $size");

  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty;
  print("Is the queue empty = $isEmpty");
}
