/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Access top of the stack element */
  // Dart has no built-in stack class, can use List as stack
  final List<int> stack = [];

  /* Elements push onto stack */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("Stack stack = $stack");

  /* Return list for printing */
  final int peek = stack.last;
  print("Top element peek = $peek");

  /* Element pop from stack */
  final int pop = stack.removeLast();
  print("Pop element pop = $pop, after pop stack = $stack");

  /* Get the length of the stack */
  final int size = stack.length;
  print("Stack length size = $size");

  /* Check if empty */
  final bool isEmpty = stack.isEmpty;
  print("Is stack empty = $isEmpty");
}
