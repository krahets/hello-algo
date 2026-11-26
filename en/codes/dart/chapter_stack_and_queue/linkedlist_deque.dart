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

/* Deque backed by a doubly linked list */
class LinkedListDeque {
  late ListNode? _front; // Head node (_front)
  late ListNode? _rear; // Tail node (_rear)
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

  /* Add an element at either end */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // If the list is empty, point both _front and _rear at node
      _front = _rear = node;
    } else if (isFront) {
      // Add at the front
      // Link node at the head of the list
      _front!.prev = node;
      node.next = _front;
      _front = node; // Update the head
    } else {
      // Add at the rear
      // Link node at the tail of the list
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Update the tail
    }
    _queSize++; // Update the deque size
  }

  /* Add an element at the front */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Add an element at the rear */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Remove an element from either end */
  int? pop(bool isFront) {
    // If the deque is empty, return null immediately
    if (isEmpty()) {
      return null;
    }
    final int val;
    // When the deque contains one element, the head and tail point to the same node
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // Remove from the front
    else if (isFront) {
      val = _front!.val; // Save the head node's value
      // Remove the head node
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // Update the head
    // Remove from the rear
    } else {
      val = _rear!.val; // Save the tail node's value
      // Remove the tail node
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // Update the tail
    }
    _queSize--; // Update the deque size
    return val;
  }

  /* Remove and return the front element */
  int? popFirst() {
    return pop(true);
  }

  /* Remove and return the rear element */
  int? popLast() {
    return pop(false);
  }

  /* Peek at the front element */
  int? peekFirst() {
    return _front?.val;
  }

  /* Peek at the rear element */
  int? peekLast() {
    return _rear?.val;
  }

  /* Return a List for printing */
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
  print("deque = ${deque.toArray()}");

  /* Peek at the front and rear elements */
  int? peekFirst = deque.peekFirst();
  print("Front element (peekFirst) = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Rear element (peekLast) = $peekLast");

  /* Add elements to the deque */
  deque.pushLast(4);
  print("After adding 4 at the rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After adding 1 at the front, deque = ${deque.toArray()}");

  /* Remove elements from both ends */
  int? popLast = deque.popLast();
  print("Removed from the rear = $popLast, deque after removal = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Removed from the front = $popFirst, deque after removal = ${deque.toArray()}");

  /* Get the deque size */
  int size = deque.size();
  print("Deque size = $size");

  /* Check whether the deque is empty */
  bool isEmpty = deque.isEmpty();
  print("Deque is empty = $isEmpty");
}
