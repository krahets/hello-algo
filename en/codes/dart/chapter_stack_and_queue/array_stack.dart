/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Stack implemented with an array */
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

  /* Push */
  void push(int _num) {
    _stack.add(_num);
  }

  /* Pop */
  int pop() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.removeLast();
  }

  /* Access the top element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  /* Return the underlying stack array */
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
  print("Stack stack = ${stack.toArray()}");

  /* Access the top element */
  final int peek = stack.peek();
  print("Top element peek = $peek");

  /* Pop an element from the stack */
  final int pop = stack.pop();
  print("Popped element pop = $pop; after popping, stack = ${stack.toArray()}");

  /* Get the stack size */
  final int size = stack.size();
  print("Stack size = $size");

  /* Check whether it is empty */
  final bool isEmpty = stack.isEmpty();
  print("Is the stack empty = $isEmpty");
}
