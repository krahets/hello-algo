/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Stack based on array implementation */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* Get the length of the stack */
  int size() {
    return _stack.length;
  }

  /* Check if the stack is empty */
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

  /* Return list for printing */
  int peek() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  /* Convert stack to Array and return */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* Access top of the stack element */
  final ArrayStack stack = ArrayStack();

  /* Elements push onto stack */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Stack stack = ${stack.toArray()}");

  /* Return list for printing */
  final int peek = stack.peek();
  print("Top element peek = $peek");

  /* Element pop from stack */
  final int pop = stack.pop();
  print("Pop element pop = $pop, after pop stack = ${stack.toArray()}");

  /* Get the length of the stack */
  final int size = stack.size();
  print("Stack length size = $size");

  /* Check if empty */
  final bool isEmpty = stack.isEmpty();
  print("Is stack empty = $isEmpty");
}
