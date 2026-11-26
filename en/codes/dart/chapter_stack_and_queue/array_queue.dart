/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Queue backed by a circular array */
class ArrayQueue {
  late List<int> _nums; // Array that stores the queue elements
  late int _front; // Index of the front element
  late int _queSize; // Queue size

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* Get the queue capacity */
  int capaCity() {
    return _nums.length;
  }

  /* Get the queue size */
  int size() {
    return _queSize;
  }

  /* Check whether the queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Enqueue an element */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Queue is full");
    }
    // Compute the index one slot past the rear element
    // Use the remainder to wrap rear back to the start of the array
    int rear = (_front + _queSize) % capaCity();
    // Add _num at the rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Remove and return the front element */
  int pop() {
    int _num = peek();
    // Advance the front index by one, wrapping to the start if it passes the end
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Peek at the front element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Queue is empty");
    }
    return _nums[_front];
  }

  /* Return the queue elements as a List */
  List<int> toArray() {
    // Copy only the elements currently in the queue
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver code */
void main() {
  /* Initialize the queue */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Enqueue elements */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("queue = ${queue.toArray()}");

  /* Peek at the front element */
  final int peek = queue.peek();
  print("Front element (peek) = $peek");

  /* Dequeue an element */
  final int pop = queue.pop();
  print("Dequeued element (pop) = $pop, queue after removal = ${queue.toArray()}");

  /* Get the queue size */
  final int size = queue.size();
  print("Queue size = $size");

  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Queue is empty = $isEmpty");

  /* Test the circular array */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("After enqueue/dequeue round $i, queue = ${queue.toArray()}");
  }
}
