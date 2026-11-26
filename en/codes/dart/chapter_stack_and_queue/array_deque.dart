/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Deque backed by a circular array */
class ArrayDeque {
  late List<int> _nums; // Array that stores the deque elements
  late int _front; // Index of the front element
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

  /* Compute the circular array index */
  int index(int i) {
    // Use the remainder to wrap indices around the array
    // When i goes past the end, wrap it back to the start
    // When i goes before the start, wrap it around to the end
    return (i + capacity()) % capacity();
  }

  /* Add an element at the front */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Deque is full");
    }
    // Move the front index one slot to the left
    // Use the remainder to wrap _front to the end if it goes before the start
    _front = index(_front - 1);
    // Add _num at the front
    _nums[_front] = _num;
    _queSize++;
  }

  /* Add an element at the rear */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Deque is full");
    }
    // Compute the index one slot past the rear element
    int rear = index(_front + _queSize);
    // Add _num at the rear
    _nums[rear] = _num;
    _queSize++;
  }

  /* Remove and return the front element */
  int popFirst() {
    int _num = peekFirst();
    // Move the front index one slot to the right
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Remove and return the rear element */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Peek at the front element */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    return _nums[_front];
  }

  /* Peek at the rear element */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("Deque is empty");
    }
    // Compute the index of the rear element
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Return a List for printing */
  List<int> toArray() {
    // Copy only the elements currently in the deque
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
  print("deque = ${deque.toArray()}");

  /* Peek at the front and rear elements */
  final int peekFirst = deque.peekFirst();
  print("Front element (peekFirst) = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Rear element (peekLast) = $peekLast");

  /* Add elements to the deque */
  deque.pushLast(4);
  print("After adding 4 at the rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After adding 1 at the front, deque = ${deque.toArray()}");

  /* Remove elements from both ends */
  final int popLast = deque.popLast();
  print("Removed from the rear = $popLast, deque after removal = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Removed from the front = $popFirst, deque after removal = ${deque.toArray()}");

  /* Get the deque size */
  final int size = deque.size();
  print("Deque size = $size");

  /* Check whether the deque is empty */
  final bool isEmpty = deque.isEmpty();
  print("Deque is empty = $isEmpty");
}
