/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* Initialize the deque */
  // In Dart, Queue is defined as a deque
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* Enqueue elements */
  deque.addLast(2); // Add to the rear
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // Add to the front
  deque.addFirst(1);
  // [endregion]{push}
  print("Deque deque = $deque");

  // [region]{peek_first}
  /* Access an element */
  final int peekFirst = deque.first; // Front element
  // [endregion]{peek_first}
  print("Front element peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // Rear element
  // [endregion]{peek_last}
  print("Rear element peekLast = $peekLast");

  // [region]{pop_first}
  /* Dequeue an element */
  final int popFirst = deque.removeFirst(); // Dequeue the front element
  // [endregion]{pop_first}
  print("Element dequeued from the front = $popFirst; after dequeuing from the front, deque = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // Dequeue the rear element
  // [endregion]{pop_last}
  print("Element dequeued from the rear = $popLast; after dequeuing from the rear, deque = $deque");

  // [region]{size}
  /* Get the deque size */
  final int size = deque.length;
  // [endregion]{size}
  print("Deque size = $size");

  // [region]{is_empty}
  /* Check whether the deque is empty */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("Is the deque empty = $isEmpty");
}
