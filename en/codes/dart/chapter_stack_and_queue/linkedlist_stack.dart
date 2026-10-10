/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Stack implemented based on linked list class */
class LinkedListStack {
  ListNode? _stackPeek; // Use head node as stack top
  int _stkSize = 0; // Stack length

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Get the length of the stack */
  int size() {
    return _stkSize;
  }

  /* Check if the stack is empty */
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

  /* Return list for printing */
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
  /* Access top of the stack element */
  final LinkedListStack stack = LinkedListStack();

  /* Elements push onto stack */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Stack stack = ${stack.toList()}");

  /* Return list for printing */
  final int peek = stack.peek();
  print("Top element peek = $peek");

  /* Element pop from stack */
  final int pop = stack.pop();
  print("Pop element pop = $pop, after pop stack = ${stack.toList()}");

  /* Get the length of the stack */
  final int size = stack.size();
  print("Stack length size = $size");

  /* Check if empty */
  final bool isEmpty = stack.isEmpty();
  print("Is stack empty = $isEmpty");
}
