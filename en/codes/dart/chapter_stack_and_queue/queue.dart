/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* Initialize the queue */
  // In Dart, the deque class Queue is commonly used as a queue
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* Enqueue elements */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("Queue queue = $queue");

  // [region]{peek}
  /* Access the front element */
  final int peek = queue.first;
  // [endregion]{peek}
  print("Front element peek = $peek");

  // [region]{pop}
  /* Dequeue an element */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("Dequeued element pop = $pop; after dequeuing, queue = $queue");

  // [region]{size}
  /* Get the queue size */
  final int size = queue.length;
  // [endregion]{size}
  print("Queue size = $size");

  // [region]{is_empty}
  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("Is the queue empty = $isEmpty");
}
