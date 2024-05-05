/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Queue class based on circular array */
class ArrayQueue {
  late List<int> _nums; // Array used to store queue elements
  late int _front; // Front pointer, pointing to the front element
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

  /* Determine if the queue is empty */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Enqueue */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Queue is full");
    }
    // Calculate rear pointer, pointing to rear index + 1
    // Use modulo operation to wrap the rear pointer from the end of the array back to the start
    int rear = (_front + _queSize) % capaCity();
    // Add _num to the back of the queue
    _nums[rear] = _num;
    _queSize++;
  }

  /* Dequeue */
  int pop() {
    int _num = peek();
    // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Access front element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Queue is empty");
    }
    return _nums[_front];
  }

  /* Return Array */
  List<int> toArray() {
    // Only convert elements within valid length range
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Initialize queue */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Element enqueue */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Queue queue = ${queue.toArray()}");

  /* Access front element */
  final int peek = queue.peek();
  print("Front element peek = $peek");

  /* Element dequeue */
  final int pop = queue.pop();
  print("Dequeue element pop = $pop, queue after dequeue = ${queue.toArray()}");

  /* Get queue length */
  final int size = queue.size();
  print("Queue length size = $size");

  /* Determine if the queue is empty */
  final bool isEmpty = queue.isEmpty();
  print("Is the queue empty = $isEmpty");

  /* Test circular array */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("After the $i-th round of enqueue + dequeue, queue = ${queue.toArray()}");
  }
}
