/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Double-ended queue class based on circular array */
class ArrayDeque {
  late List<int> _nums; // Array used to store elements of the double-ended queue
  late int _front; // Front pointer, pointing to the front element
  late int _queSize; // Length of the double-ended queue

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

  /* Determine if the double-ended queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Calculate circular array index */
  int index(int i) {
    // Implement circular array by modulo operation
    // When i exceeds the tail of the array, return to the head
    // When i exceeds the head of the array, return to the tail
    return (i + capacity()) % capacity();
  }

  /* Front enqueue */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Double-ended queue is full");
    }
    // Move the front pointer one position to the left
    // Implement _front crossing the head of the array back to the end by modulo operation
    _front = index(_front - 1);
    // Add _num to the front of the queue
    _nums[_front] = _num;
    _queSize++;
  }

  /* Rear enqueue */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Double-ended queue is full");
    }
    // Calculate rear pointer, pointing to rear index + 1
    int rear = index(_front + _queSize);
    // Add _num to the back of the queue
    _nums[rear] = _num;
    _queSize++;
  }

  /* Front dequeue */
  int popFirst() {
    int _num = peekFirst();
    // Move the front pointer right by one
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Rear dequeue */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Access front element */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("Double-ended queue is empty");
    }
    return _nums[_front];
  }

  /* Access rear element */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("Double-ended queue is empty");
    }
    // Calculate rear element index
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Return array for printing */
  List<int> toArray() {
    // Only convert elements within valid length range
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Initialize double-ended queue */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Double-ended queue deque = ${deque.toArray()}");

  /* Access element */
  final int peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Back element peekLast = $peekLast");

  /* Element enqueue */
  deque.pushLast(4);
  print("Element 4 enqueued at the back, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("Element 1 enqueued at the front, deque = ${deque.toArray()}");

  /* Element dequeue */
  final int popLast = deque.popLast();
  print("Back dequeue element = $popLast, deque after back dequeue = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Front dequeue element = $popFirst, deque after front dequeue = ${deque.toArray()}");

  /* Get the length of the double-ended queue */
  final int size = deque.size();
  print("Double-ended queue length size = $size");

  /* Determine if the double-ended queue is empty */
  final bool isEmpty = deque.isEmpty();
  print("Is the double-ended queue empty = $isEmpty");
}
