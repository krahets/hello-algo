/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Deque implemented with a circular array */
class ArrayDeque {
  late List<int> _nums; // Array for storing deque elements
  late int _front; // Front pointer, pointing to the first element
  late int _queSize; // Deque size

  /* Constructor */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* Get the deque capacity */
  int capacity() {
    return _nums.length;
  }

  /* Get the deque size */
  int size() {
    return _queSize;
  }

  /* Check whether the deque is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Calculate an index in the circular array */
  int index(int i) {
    // Use modulo to connect the end of the array to its beginning
    // When i passes the end of the array, wrap around to the beginning
    // When i passes the beginning of the array, wrap around to the end
    return (i + capacity()) % capacity();
  }

  /* Enqueue at the front */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Deque is full");
    }
    // Move the front pointer one position to the left
    // Use modulo to wrap _front to the end when it passes the beginning of the array
    _front = index(_front - 1);
    // Add _num to the front
    _nums[_front] = _num;
    _queSize++;
  }

  /* Enqueue at the rear */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Deque is full");
    }
    // Calculate the rear pointer, which points one position past the last element
    int rear = index(_front + _queSize);
    // Add _num to the rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Dequeue from the front */
  int popFirst() {
    int _num = peekFirst();
    // Move the front pointer one position to the right
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Dequeue from the rear */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Access the front element */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    return _nums[_front];
  }

  /* Access the rear element */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    // Calculate the index of the last element
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Return an array for printing */
  List<int> toArray() {
    // Convert only the list elements within the occupied range
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver code */
void main() {
  /* Initialize the deque */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Deque deque = ${deque.toArray()}");

  /* Access an element */
  final int peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Rear element peekLast = $peekLast");

  /* Enqueue elements */
  deque.pushLast(4);
  print("After enqueuing 4 at the rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After enqueuing 1 at the front, deque = ${deque.toArray()}");

  /* Dequeue an element */
  final int popLast = deque.popLast();
  print("Element dequeued from the rear = $popLast; after dequeuing from the rear, deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Element dequeued from the front = $popFirst; after dequeuing from the front, deque = ${deque.toArray()}");

  /* Get the deque size */
  final int size = deque.size();
  print("Deque size = $size");

  /* Check whether the deque is empty */
  final bool isEmpty = deque.isEmpty();
  print("Is the deque empty = $isEmpty");
}
