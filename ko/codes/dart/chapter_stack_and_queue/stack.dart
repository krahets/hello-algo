/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* 스택 초기화 */
  // Dart에는 내장 스택 클래스가 없으므로 List를 스택으로 사용할 수 있다
  final List<int> stack = [];

  /* 스택에 원소 삽입 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("스택 stack = $stack");

  /* 스택 맨 위 원소 접근 */
  final int peek = stack.last;
  print("스택의 맨 위 원소 peek = $peek");

  /* 스택에서 원소 꺼내기 */
  final int pop = stack.removeLast();
  print("스택에서 꺼낸 원소 pop = $pop , 꺼낸 후 stack = $stack");

  /* 스택의 길이 반환 */
  final int size = stack.length;
  print("스택의 길이 size = $size");

  /* 비어 있는지 판단 */
  final bool isEmpty = stack.isEmpty;
  print("스택이 비어 있는가 = $isEmpty");
}
