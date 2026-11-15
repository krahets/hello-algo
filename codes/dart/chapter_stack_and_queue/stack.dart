/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* 初始化栈 */
  // Dart 没有内置的栈类，可以把 List 当作栈来使用
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* 元素入栈 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("栈 stack = $stack");

  // [region]{peek}
  /* 访问栈顶元素 */
  final int peek = stack.last;
  // [endregion]{peek}
  print("栈顶元素 peek = $peek");

  // [region]{pop}
  /* 元素出栈 */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("出栈元素 pop = $pop ，出栈后 stack = $stack");

  // [region]{size}
  /* 获取栈的长度 */
  final int size = stack.length;
  // [endregion]{size}
  print("栈的长度 size = $size");

  // [region]{is_empty}
  /* 判断是否为空 */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("栈是否为空 = $isEmpty");
}
