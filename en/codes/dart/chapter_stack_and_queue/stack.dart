/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Initialize the stack */
  // Dart has no built-in stack class, so use a List as a stack
  final List<int> stack = [];

  /* Push elements onto the stack */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("stack = $stack");

  /* Peek at the top element */
  final int peek = stack.last;
  print("Top element (peek) = $peek");

  /* Pop the top element */
  final int pop = stack.removeLast();
  print("Popped element (pop) = $pop, stack after the pop = $stack");

  /* Get the stack size */
  final int size = stack.length;
  print("Stack size = $size");

  /* Check whether the stack is empty */
  final bool isEmpty = stack.isEmpty;
  print("Stack is empty = $isEmpty");
}
