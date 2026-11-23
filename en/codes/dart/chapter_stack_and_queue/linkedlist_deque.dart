/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Doubly linked list node */
class ListNode {
  int val; // Node value
  ListNode? next; // Reference to the next node
  ListNode? prev; // Reference to the previous node

  ListNode(this.val, {this.next, this.prev});
}

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
  late ListNode? _front; // Head node _front
  late ListNode? _rear; // Tail node _rear
  int _queSize = 0; // Deque size

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* Get the deque size */
  int size() {
    return this._queSize;
  }

  /* Check whether the deque is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Enqueue operation */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // If the linked list is empty, make both _front and _rear point to node
      _front = _rear = node;
    } else if (isFront) {
      // Enqueue at the front
      // Add node to the head of the linked list
      _front!.prev = node;
      node.next = _front;
      _front = node; // Update the head node
    } else {
      // Enqueue at the rear
      // Add node to the tail of the linked list
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Update the tail node
    }
    _queSize++; // Update the queue size
  }

  /* Enqueue at the front */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Enqueue at the rear */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Dequeue operation */
  int? pop(bool isFront) {
    // If the queue is empty, return null immediately
    if (isEmpty()) {
      return null;
    }
    final int val;
    // When the queue size is 1, the head and tail point to the same node
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // Dequeue from the front
    else if (isFront) {
      val = _front!.val; // Save the head node value
      // Remove the head node
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // Update the head node
    // Dequeue from the rear
    } else {
      val = _rear!.val; // Save the tail node value
      // Remove the tail node
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // Update the tail node
    }
    _queSize--; // Update the queue size
    return val;
  }

  /* Dequeue from the front */
  int? popFirst() {
    return pop(true);
  }

  /* Dequeue from the rear */
  int? popLast() {
    return pop(false);
  }

  /* Access the front element */
  int? peekFirst() {
    return _front?.val;
  }

  /* Access the rear element */
  int? peekLast() {
    return _rear?.val;
  }

  /* Return an array for printing */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> res = [];
    for (int i = 0; i < _queSize; i++) {
      res.add(node!.val);
      node = node.next;
    }
    return res;
  }
}

/* Driver code */
void main() {
  /* Initialize the deque */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Deque deque = ${deque.toArray()}");

  /* Access an element */
  int? peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Rear element peekLast = $peekLast");

  /* Enqueue elements */
  deque.pushLast(4);
  print("After enqueuing 4 at the rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After enqueuing 1 at the front, deque = ${deque.toArray()}");

  /* Dequeue an element */
  int? popLast = deque.popLast();
  print("Element dequeued from the rear = $popLast; after dequeuing from the rear, deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Element dequeued from the front = $popFirst; after dequeuing from the front, deque = ${deque.toArray()}");

  /* Get the deque size */
  int size = deque.size();
  print("Deque size = $size");

  /* Check whether the deque is empty */
  bool isEmpty = deque.isEmpty();
  print("Is the deque empty = $isEmpty");
}
