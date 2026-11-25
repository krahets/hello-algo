/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Stack backed by a linked list */
class LinkedListStack {
  ListNode? _stackPeek; // Use the head node as the top of the stack
  int _stkSize = 0; // Stack size

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Get the stack size */
  int size() {
    return _stkSize;
  }

  /* Check whether the stack is empty */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* Push an element onto the stack */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* Remove and return the top element */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* Peek at the top element */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("Stack is empty");
    }
    return _stackPeek!.val;
  }

  /* Return the linked list elements as a List */
  List<int> toList() {
    ListNode? node = _stackPeek;
    List<int> list = [];
    while (node != null) {
      list.add(node.val);
      node = node.next;
    }
    list = list.reversed.toList();
    return list;
  }
}

/* Driver code */
void main() {
  /* Initialize the stack */
  final LinkedListStack stack = LinkedListStack();

  /* Push elements onto the stack */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("stack = ${stack.toList()}");

  /* Peek at the top element */
  final int peek = stack.peek();
  print("Top element (peek) = $peek");

  /* Pop the top element */
  final int pop = stack.pop();
  print("Popped element (pop) = $pop, stack after the pop = ${stack.toList()}");

  /* Get the stack size */
  final int size = stack.size();
  print("Stack size = $size");

  /* Check whether the stack is empty */
  final bool isEmpty = stack.isEmpty();
  print("Stack is empty = $isEmpty");
}
