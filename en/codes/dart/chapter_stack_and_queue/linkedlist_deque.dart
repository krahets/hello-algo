/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Doubly linked list node */
class ListNode {
  int val; // Node value
  ListNode? next; // Successor node reference
  ListNode? prev; // Predecessor node reference

  ListNode(this.val, {this.next, this.prev});
}

/* Deque implemented based on doubly linked list */
class LinkedListDeque {
  late ListNode? _front; // Head node _front
  late ListNode? _rear; // Tail node _rear
  int _queSize = 0; // Length of the double-ended queue

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* Get deque length */
  int size() {
    return this._queSize;
  }

  /* Check if the double-ended queue is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Enqueue operation */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // If list is empty, let both _front and _rear point to node
      _front = _rear = node;
    } else if (isFront) {
      // Front of the queue enqueue operation
      // Add node to the head of the linked list
      _front!.prev = node;
      node.next = _front;
      _front = node; // Update head node
    } else {
      // Rear of the queue enqueue operation
      // Add node to the tail of the linked list
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Update tail node
    }
    _queSize++; // Update queue length
  }

  /* Front of the queue enqueue */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Rear of the queue enqueue */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Dequeue operation */
  int? pop(bool isFront) {
    // If queue is empty, return null directly
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // Temporarily store head node value
      val = _front!.val; // Delete head node
      // Delete head node
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // Update head node
    } else {
      // Temporarily store tail node value
      val = _rear!.val; // Delete tail node
      // Update tail node
      ListNode? rPrev = _rear!.prev;
      if (rPrev != null) {
        rPrev.next = null;
        _rear!.prev = null;
      }
      _rear = rPrev; // Update tail node
    }
    _queSize--; // Update queue length
    return val;
  }

  /* Rear of the queue dequeue */
  int? popFirst() {
    return pop(true);
  }

  /* Access rear of the queue element */
  int? popLast() {
    return pop(false);
  }

  /* Return list for printing */
  int? peekFirst() {
    return _front?.val;
  }

  /* Driver Code */
  int? peekLast() {
    return _rear?.val;
  }

  /* Return array for printing */
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

/* Driver Code */
void main() {
  /* Get the length of the double-ended queue */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Deque deque = ${deque.toArray()}");

  /* Update element */
  int? peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Rear element peekLast = $peekLast");

  /* Elements enqueue */
  deque.pushLast(4);
  print("After element 4 enqueues at rear, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("After element 1 enqueues at front, deque = ${deque.toArray()}");

  /* Element dequeue */
  int? popLast = deque.popLast();
  print("Dequeue rear element = $popLast, after rear dequeue deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Dequeue front element = $popFirst, after front dequeue deque = ${deque.toArray()}");

  /* Get the length of the double-ended queue */
  int size = deque.size();
  print("Deque length size = $size");

  /* Check if the double-ended queue is empty */
  bool isEmpty = deque.isEmpty();
  print("Is deque empty = $isEmpty");
}
