/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基于数组实现的栈 */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* 获取栈的长度 */
  int size() {
    return _stack.length;
  }

  /* 判断栈是否为空 */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* 入栈 */
  void push(int _num) {
    _stack.add(_num);
  }

  /* 出栈 */
  int pop() {
    if (isEmpty()) {
      throw Exception("栈为空");
    }
    return _stack.removeLast();
  }

  /* 访问栈顶元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("栈为空");
    }
    return _stack.last;
  }

  /* 将栈转化为 Array 并返回 */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* 初始化栈 */
  final ArrayStack stack = ArrayStack();

  /* 元素入栈 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("栈 stack = ${stack.toArray()}");

  /* 访问栈顶元素 */
  final int peek = stack.peek();
  print("栈顶元素 peek = $peek");

  /* 元素出栈 */
  final int pop = stack.pop();
  print("出栈元素 pop = $pop ，出栈后 stack = ${stack.toArray()}");

  /* 获取栈的长度 */
  final int size = stack.size();
  print("栈的长度 size = $size");

  /* 判断是否为空 */
  final bool isEmpty = stack.isEmpty();
  print("栈是否为空 = $isEmpty");
}
