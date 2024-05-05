/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Initialize stack */
  // Dart does not have a built-in stack class, List can be used as a stack
  final List<int> stack = [];

  /* Element push */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("Stack stack = $stack");

  /* Access stack top element */
  final int peek = stack.last;
  print("Top element of the stack peek = $peek");

  /* Element pop */
  final int pop = stack.removeLast();
  print("Pop element pop = $pop, stack after pop = $stack");

  /* Get the length of the stack */
  final int size = stack.length;
  print("Stack length size = $size");

  /* Determine if it's empty */
  final bool isEmpty = stack.isEmpty;
  print("Is the stack empty = $isEmpty");
}
