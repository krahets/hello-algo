/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Double-linked list node */
class ListNode {
  int val; // Node value
  ListNode? next; // Reference to successor node
  ListNode? prev; // Reference to predecessor node

  ListNode(this.val, {this.next, this.prev});
}

/* Double-ended queue implemented using a doubly linked list */
class LinkedListDeque {
  late ListNode? _front; // Head node _front
  late ListNode? _rear; // Tail node _rear
  int _queSize = 0; // Length of the double-ended queue

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* Get double-ended queue length */
  int size() {
    return this._queSize;
  }

  /* Determine if the double-ended queue is empty */
  bool isEmpty() {
    return size() == 0;
  }

  /* Enqueue operation */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // If the linked list is empty, set both _front and _rear to node
      _front = _rear = node;
    } else if (isFront) {
      // Front enqueue operation
      // Add node to the head of the list
      _front!.prev = node;
      node.next = _front;
      _front = node; // Update head node
    } else {
      // Rear enqueue operation
      // Add node to the tail of the list
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Update tail node
    }
    _queSize++; // Update queue length
  }

  /* Front enqueue */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Rear enqueue */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Dequeue operation */
  int? pop(bool isFront) {
    // If the queue is empty, return null
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // Front dequeue operation
      val = _front!.val; // Temporarily store the head node value
      // Remove head node
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // Update head node
    } else {
      // Rear dequeue operation
      val = _rear!.val; // Temporarily store the tail node value
      // Remove tail node
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

  /* Front dequeue */
  int? popFirst() {
    return pop(true);
  }

  /* Rear dequeue */
  int? popLast() {
    return pop(false);
  }

  /* Access front element */
  int? peekFirst() {
    return _front?.val;
  }

  /* Access rear element */
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
  /* Initialize double-ended queue */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Double-ended queue deque = ${deque.toArray()}");

  /* Access element */
  int? peekFirst = deque.peekFirst();
  print("Front element peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Back element peekLast = $peekLast");

  /* Element enqueue */
  deque.pushLast(4);
  print("Element 4 enqueued at the back, deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("Element 1 enqueued at the front, deque = ${deque.toArray()}");

  /* Element dequeue */
  int? popLast = deque.popLast();
  print("Back dequeue element = $popLast, deque after back dequeue = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Front dequeue element = $popFirst, deque after front dequeue = ${deque.toArray()}");

  /* Get the length of the double-ended queue */
  int size = deque.size();
  print("Double-ended queue length size = $size");

  /* Determine if the double-ended queue is empty */
  bool isEmpty = deque.isEmpty();
  print("Is the double-ended queue empty = $isEmpty");
}
