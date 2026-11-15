/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* Initialize the stack */
  // Dart has no built-in stack class; a List can be used as a stack
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* Push elements onto the stack */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("Stack stack = $stack");

  // [region]{peek}
  /* Access the top element */
  final int peek = stack.last;
  // [endregion]{peek}
  print("Top element peek = $peek");

  // [region]{pop}
  /* Pop an element from the stack */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("Popped element pop = $pop; after popping, stack = $stack");

  // [region]{size}
  /* Get the stack size */
  final int size = stack.length;
  // [endregion]{size}
  print("Stack size = $size");

  // [region]{is_empty}
  /* Check whether it is empty */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("Is the stack empty = $isEmpty");
}
