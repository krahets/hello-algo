/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Queue based on circular array implementation */
class ArrayQueue {
  late List<int> _nums; // Array for storing queue elements
  late int _front; // Front pointer, points to the front of the queue element
  late int _queSize; // Queue length

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* Get the capacity of the queue */
  int capaCity() {
    return _nums.length;
  }

  /* Get the length of the queue */
  int size() {
    return _queSize;
  }

  /* Check if the queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Enqueue */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Queue is full");
    }
    // Use modulo operation to wrap rear around to the head after passing the tail of the array
    // Add num to the rear of the queue
    int rear = (_front + _queSize) % capaCity();
    // Add _num to queue rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Dequeue */
  int pop() {
    int _num = peek();
    // Move front pointer backward by one position, if it passes the tail, return to array head
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Return list for printing */
  int peek() {
    if (isEmpty()) {
      throw Exception("Queue is empty");
    }
    return _nums[_front];
  }

  /* Return Array */
  List<int> toArray() {
    // Elements enqueue
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Access front of the queue element */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Elements enqueue */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Queue queue = ${queue.toArray()}");

  /* Return list for printing */
  final int peek = queue.peek();
  print("Front element peek = $peek");

  /* Element dequeue */
  final int pop = queue.pop();
  print("Dequeue element pop = $pop, after dequeue queue = ${queue.toArray()}");

  /* Get queue length */
  final int size = queue.size();
  print("Queue length size = $size");

  /* Check if the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Is queue empty = $isEmpty");

  /* Test circular array */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("After round $i enqueue + dequeue, queue = ${queue.toArray()}");
  }
}
