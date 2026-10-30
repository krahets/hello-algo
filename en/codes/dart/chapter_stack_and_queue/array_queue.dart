/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Queue implemented with a circular array */
class ArrayQueue {
  late List<int> _nums; // Array that stores the queue elements
  late int _front; // Front pointer, pointing to the first element
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

  /* Enqueue */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Queue is full");
    }
    // Calculate the rear pointer, which points one position past the last element
    // Use modulo to wrap rear to the beginning when it passes the end of the array
    int rear = (_front + _queSize) % capaCity();
    // Add _num to the rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Dequeue */
  int pop() {
    int _num = peek();
    // Advance the front pointer by one position, wrapping to the beginning if it passes the end
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Access the front element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Queue is empty");
    }
    return _nums[_front];
  }

  /* Return an array */
  List<int> toArray() {
    // Convert only the list elements within the occupied range
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
  print("Queue queue = ${queue.toArray()}");

  /* Access the front element */
  final int peek = queue.peek();
  print("Front element peek = $peek");

  /* Dequeue an element */
  final int pop = queue.pop();
  print("Dequeued element pop = $pop; after dequeuing, queue = ${queue.toArray()}");

  /* Get the queue size */
  final int size = queue.size();
  print("Queue size = $size");

  /* Check whether the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Is the queue empty = $isEmpty");

  /* Test the circular array */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("Round $i: after enqueue + dequeue, queue = ${queue.toArray()}");
  }
}
