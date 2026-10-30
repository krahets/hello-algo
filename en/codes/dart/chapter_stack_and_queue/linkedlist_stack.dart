/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Stack implemented with a linked list */
class LinkedListStack {
  ListNode? _stackPeek; // Use the head node as the stack top
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

  /* Push */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* Pop */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* Access the top element */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("Stack is empty");
    }
    return _stackPeek!.val;
  }

  /* Convert the linked list to a List and return it */
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
  print("Stack stack = ${stack.toList()}");

  /* Access the top element */
  final int peek = stack.peek();
  print("Top element peek = $peek");

  /* Pop an element from the stack */
  final int pop = stack.pop();
  print("Popped element pop = $pop; after popping, stack = ${stack.toList()}");

  /* Get the stack size */
  final int size = stack.size();
  print("Stack size = $size");

  /* Check whether it is empty */
  final bool isEmpty = stack.isEmpty();
  print("Is the stack empty = $isEmpty");
}
