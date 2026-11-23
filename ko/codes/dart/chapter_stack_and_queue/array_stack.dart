/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 배열로 구현한 스택 */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* 스택의 길이 반환 */
  int size() {
    return _stack.length;
  }

  /* 스택이 비어 있는지 판단 */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* 스택에 삽입 */
  void push(int _num) {
    _stack.add(_num);
  }

  /* 스택에서 꺼내기 */
  int pop() {
    if (isEmpty()) {
      throw Exception("스택이 비어 있다");
    }
    return _stack.removeLast();
  }

  /* 스택 맨 위 원소 접근 */
  int peek() {
    if (isEmpty()) {
      throw Exception("스택이 비어 있다");
    }
    return _stack.last;
  }

  /* 스택을 Array로 변환하여 반환 */
  List<int> toArray() => _stack;
}

/* 실행 코드 */
void main() {
  /* 스택 초기화 */
  final ArrayStack stack = ArrayStack();

  /* 스택에 원소 삽입 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("스택 stack = ${stack.toArray()}");

  /* 스택 맨 위 원소 접근 */
  final int peek = stack.peek();
  print("스택의 맨 위 원소 peek = $peek");

  /* 스택에서 원소 꺼내기 */
  final int pop = stack.pop();
  print("스택에서 꺼낸 원소 pop = $pop , 꺼낸 후 stack = ${stack.toArray()}");

  /* 스택의 길이 반환 */
  final int size = stack.size();
  print("스택의 길이 size = $size");

  /* 비어 있는지 판단 */
  final bool isEmpty = stack.isEmpty();
  print("스택이 비어 있는가 = $isEmpty");
}
