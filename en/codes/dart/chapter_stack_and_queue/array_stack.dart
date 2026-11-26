/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Array-backed stack */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* Get the stack size */
  int size() {
    return _stack.length;
  }

  /* Check whether the stack is empty */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* Push an element onto the stack */
  void push(int _num) {
    _stack.add(_num);
  }

  /* Remove and return the top element */
  int pop() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.removeLast();
  }

  /* Peek at the top element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  /* Return the list that backs the stack */
  List<int> toArray() => _stack;
}

/* Driver code */
void main() {
  /* Initialize the stack */
  final ArrayStack stack = ArrayStack();

  /* Push elements onto the stack */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("stack = ${stack.toArray()}");

  /* Peek at the top element */
  final int peek = stack.peek();
  print("Top element (peek) = $peek");

  /* Pop the top element */
  final int pop = stack.pop();
  print("Popped element (pop) = $pop, stack after the pop = ${stack.toArray()}");

  /* Get the stack size */
  final int size = stack.size();
  print("Stack size = $size");

  /* Check whether the stack is empty */
  final bool isEmpty = stack.isEmpty();
  print("Stack is empty = $isEmpty");
}
