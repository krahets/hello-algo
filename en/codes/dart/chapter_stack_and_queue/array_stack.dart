/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Stack class based on array */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* Get the length of the stack */
  int size() {
    return _stack.length;
  }

  /* Determine if the stack is empty */
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

  /* Access stack top element */
  int peek() {
    if (isEmpty()) {
      throw Exception("Stack is empty");
    }
    return _stack.last;
  }

  /* Convert the stack to Array and return */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* Initialize stack */
  final ArrayStack stack = ArrayStack();

  /* Element push */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Stack stack = ${stack.toArray()}");

  /* Access stack top element */
  final int peek = stack.peek();
  print("Top element of the stack peek = $peek");

  /* Element pop */
  final int pop = stack.pop();
  print("Pop element pop = $pop, stack after pop = ${stack.toArray()}");

  /* Get the length of the stack */
  final int size = stack.size();
  print("Stack length size = $size");

  /* Determine if it's empty */
  final bool isEmpty = stack.isEmpty();
  print("Is the stack empty = $isEmpty");
}
