/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
  late List<int> _nums; // Array for storing double-ended queue elements
  late int _front; // Front pointer, points to the front of the queue element
  late int _queSize; // Double-ended queue length

  /* Constructor */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* Get the capacity of the double-ended queue */
  int capacity() {
    return _nums.length;
  }

  /* Get the length of the double-ended queue */
  int size() {
    return _queSize;
  }

  /* Check if the double-ended queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Calculate circular array index */
  int index(int i) {
    // Use modulo operation to wrap the array head and tail together
    // When i passes the tail of the array, return to the head
    // When i passes the head of the array, return to the tail
    return (i + capacity()) % capacity();
  }

  /* Front of the queue enqueue */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Double-ended queue is full");
    }
    // Use modulo operation to wrap front around to the tail after passing the head of the array
    // Use modulo operation to wrap _front from array head back to tail
    _front = index(_front - 1);
    // Add _num to queue front
    _nums[_front] = _num;
    _queSize++;
  }

  /* Rear of the queue enqueue */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Double-ended queue is full");
    }
    // Use modulo operation to wrap rear around to the head after passing the tail of the array
    int rear = index(_front + _queSize);
    // Add _num to queue rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Rear of the queue dequeue */
  int popFirst() {
    int _num = peekFirst();
    // Move front pointer right by one
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Access rear of the queue element */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Return list for printing */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    return _nums[_front];
  }

  /* Driver Code */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    // Initialize double-ended queue
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Return array for printing */
  List<int> toArray() {
    // Elements enqueue
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Get the length of the double-ended queue */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Deque deque = ${deque.toArray()}");

  /* Update element */
  final int peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Rear element peekLast = $peekLast");

  /* Elements enqueue */
  deque.pushLast(4);
  print("After element 4 enqueues at rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After element 1 enqueues at front, deque = ${deque.toArray()}");

  /* Element dequeue */
  final int popLast = deque.popLast();
  print("Dequeue rear element = $popLast, after rear dequeue deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Dequeue front element = $popFirst, after front dequeue deque = ${deque.toArray()}");

  /* Get the length of the double-ended queue */
  final int size = deque.size();
  print("Deque length size = $size");

  /* Check if the double-ended queue is empty */
  final bool isEmpty = deque.isEmpty();
  print("Is deque empty = $isEmpty");
}
