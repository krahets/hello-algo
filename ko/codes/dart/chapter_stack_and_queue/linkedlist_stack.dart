/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 연결 리스트 클래스로 구현한 스택 */
class LinkedListStack {
  ListNode? _stackPeek; // 머리 노드를 스택의 맨 위로 사용한다
  int _stkSize = 0; // 스택의 길이

  LinkedListStack() {
    _stackPeek = null;
  }

  /* 스택의 길이 반환 */
  int size() {
    return _stkSize;
  }

  /* 스택이 비어 있는지 판단 */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* 스택에 삽입 */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* 스택에서 꺼내기 */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* 스택 맨 위 원소 접근 */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("스택이 비어 있다");
    }
    return _stackPeek!.val;
  }

  /* 연결 리스트를 List로 변환하여 반환 */
  List<int> toList() {
    ListNode? node = _stackPeek;
    List<int> list = [];
    while (node != null) {
      list.add(node.val);
      node = node.next;
    }
    list = list.reversed.toList();
    return list;
  }
}

/* 실행 코드 */
void main() {
  /* 스택 초기화 */
  final LinkedListStack stack = LinkedListStack();

  /* 스택에 원소 삽입 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("스택 stack = ${stack.toList()}");

  /* 스택 맨 위 원소 접근 */
  final int peek = stack.peek();
  print("스택의 맨 위 원소 peek = $peek");

  /* 스택에서 원소 꺼내기 */
  final int pop = stack.pop();
  print("스택에서 꺼낸 원소 pop = $pop , 꺼낸 후 stack = ${stack.toList()}");

  /* 스택의 길이 반환 */
  final int size = stack.size();
  print("스택의 길이 size = $size");

  /* 비어 있는지 판단 */
  final bool isEmpty = stack.isEmpty();
  print("스택이 비어 있는가 = $isEmpty");
}
