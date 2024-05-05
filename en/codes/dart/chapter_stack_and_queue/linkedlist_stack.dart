/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Stack implemented using a linked list class */
class LinkedListStack {
  ListNode? _stackPeek; // Use the head node as the top of the stack
  int _stkSize = 0; // Length of the stack

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Get the length of the stack */
  int size() {
    return _stkSize;
  }

  /* Determine if the stack is empty */
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

  /* Access stack top element */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("Stack is empty");
    }
    return _stackPeek!.val;
  }

  /* Convert linked list to List and return */
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

/* Driver Code */
void main() {
  /* Initialize stack */
  final LinkedListStack stack = LinkedListStack();

  /* Element push */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Stack stack = ${stack.toList()}");

  /* Access stack top element */
  final int peek = stack.peek();
  print("Top element of the stack peek = $peek");

  /* Element pop */
  final int pop = stack.pop();
  print("Pop element pop = $pop, stack after pop = ${stack.toList()}");

  /* Get the length of the stack */
  final int size = stack.size();
  print("Stack length size = $size");

  /* Determine if it's empty */
  final bool isEmpty = stack.isEmpty();
  print("Is the stack empty = $isEmpty");
}
