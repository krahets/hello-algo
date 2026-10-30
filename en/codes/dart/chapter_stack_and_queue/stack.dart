/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Initialize the stack */
  // Dart has no built-in stack class; a List can be used as a stack
  final List<int> stack = [];

  /* Push elements onto the stack */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("Stack stack = $stack");

  /* Access the top element */
  final int peek = stack.last;
  print("Top element peek = $peek");

  /* Pop an element from the stack */
  final int pop = stack.removeLast();
  print("Popped element pop = $pop; after popping, stack = $stack");

  /* Get the stack size */
  final int size = stack.length;
  print("Stack size = $size");

  /* Check whether it is empty */
  final bool isEmpty = stack.isEmpty;
  print("Is the stack empty = $isEmpty");
}
