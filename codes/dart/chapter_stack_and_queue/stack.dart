/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* 初始化栈 */
  // Dart 没有内置的栈类，可以把 List 当作栈来使用
  final List<int> stack = [];

  /* 元素入栈 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("栈 stack = $stack");

  /* 访问栈顶元素 */
  final int peek = stack.last;
  print("栈顶元素 peek = $peek");

  /* 元素出栈 */
  final int pop = stack.removeLast();
  print("出栈元素 pop = $pop ，出栈后 stack = $stack");

  /* 获取栈的长度 */
  final int size = stack.length;
  print("栈的长度 size = $size");

  /* 判断是否为空 */
  final bool isEmpty = stack.isEmpty;
  print("栈是否为空 = $isEmpty");
}
