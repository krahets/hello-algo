/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* 스택 초기화 */
  // Dart에는 내장 스택 클래스가 없으므로 List를 스택으로 사용할 수 있다
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* 스택에 원소 삽입 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("스택 stack = $stack");

  // [region]{peek}
  /* 스택 맨 위 원소 접근 */
  final int peek = stack.last;
  // [endregion]{peek}
  print("스택의 맨 위 원소 peek = $peek");

  // [region]{pop}
  /* 스택에서 원소 꺼내기 */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("스택에서 꺼낸 원소 pop = $pop , 꺼낸 후 stack = $stack");

  // [region]{size}
  /* 스택의 길이 반환 */
  final int size = stack.length;
  // [endregion]{size}
  print("스택의 길이 size = $size");

  // [region]{is_empty}
  /* 비어 있는지 판단 */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("스택이 비어 있는가 = $isEmpty");
}
